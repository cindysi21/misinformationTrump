import pandas as pd
import os
import math

FOLDER = '../data/fake1/'
#insert all the indices here (i.e. ['876, '900', '430'])] Could also automatically grab file names,
    # but did it this way bc I needed some but not all files at different points in time. Can be changed
INDICES = []

for i in INDICES:
    #Clean TIME data (created_at & retweeted_statues.created_at)
    cleanDF = pd.read_csv(FOLDER + "data" + str(i) + "/export.csv", skipinitialspace = True)
    cleanDF = cleanDF.replace({'Tue Nov 08 ': ''}, regex=True)
    cleanDF = cleanDF.replace({' \+0000 2016': ''}, regex=True)

    #Change type of column from text to time
    createdTime = (pd.to_datetime(cleanDF['created_at'], format='%H:%M:%S'))
    retweetedTime = (pd.to_datetime(cleanDF['retweeted_status.created_at'], format='%H:%M:%S'))

    #Create new columns (Time Difference, Weight, Size)
    cleanDF['Time Difference'] = pd.to_timedelta(createdTime - retweetedTime, unit='s')
    cleanDF['Weight'] = 1 / (cleanDF['Time Difference'].dt.seconds / (24 * 60 * 60)) / 10
    cleanDF['size'] = cleanDF['user.followers_count']/cleanDF['user.friends_count']

    #Clean up remaining data
    cleanDF.rename(columns={'retweeted_status.id': 'Source'}, inplace=True)
    cleanDF['Target'] = cleanDF['id'].astype('str')
    cleanDF['Source'] = cleanDF['Source'].astype('str')
    cleanDF['id'] = cleanDF['id'].astype('str')
    cleanDF['user.id'] = cleanDF['user.id'].astype('str')

    #Edge CSV does not need first row which is the original tweet
    edge = cleanDF.iloc[1:]
    #Node CSV does not need Target & Source, only needs id
    node = cleanDF.drop(columns = ['Target', 'Source'])

    #Convert to CSV
    node.to_csv(FOLDER + "data" + str(i) + '/node.csv', index=False)
    edge.to_csv(FOLDER + "data" + str(i) + '/edge.csv', index=False)


    #test
    print(i)