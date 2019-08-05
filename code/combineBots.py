#Combines all bot files (related/unrelated to fake news distinction)

import pandas as pd

LOC = '../data'
FOLDERS = ['fake1', 'fake2','fake4_5','not']


FILE_NAMES = ['bot.csv','bot75.csv','na.csv','na75.csv','not.csv','not75.csv']
#FILE_NAMES = ['bot.csv']
NEW_NAMES = ['all_bot.csv', 'all_bot75.csv', 'all_na.csv','all_na75.csv','all_not.csv','all_not75.csv']

for fileIndex in range(len(FILE_NAMES)):
    new = pd.DataFrame(columns=['Time Difference', 'Retweet Count'])
    for folder in FOLDERS:
        df = pd.read_csv(LOC + '/' + folder + '/' + FILE_NAMES[fileIndex])
        new = new.append(df, ignore_index=True)
    new.to_csv(LOC + '/' + NEW_NAMES[fileIndex])



