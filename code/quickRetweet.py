import pandas as pd
import os
import datetime
import numpy as np

#Cleans data to find first X number of retweets and other personalizable Twitter characteristics

os.chdir('../data/fake4_5/')

dir_list = next(os.walk('.'))[1]
df = pd.DataFrame(columns=['Folder', 'Retweet Count', 'Time Difference', 'Estimated Time', 'Total Retweeted', 'Retweeted Followers'])
nf = pd.DataFrame(columns=['Folder','Retweet Count', 'Time Difference', 'Total Retweeted', 'Retweeted Followers'])
for folder in dir_list:
    nodes = pd.read_csv(folder + '/new_node.csv')
    nodes['time'] = pd.to_timedelta(nodes['Time Difference'])
    lastRetweet = nodes['retweeted_status.retweet_count'][len(nodes)-1]
    firstRetweets = [nodes['retweeted_status.retweet_count'][0],nodes['retweeted_status.retweet_count'][1]]
    if firstRetweets[0] == firstRetweets[0]:
        retweet = firstRetweets[0]
        time = nodes['time'][0]
        df = df.append(pd.DataFrame({'Folder': folder, 'Retweet Count': firstRetweets[0], 'Time Difference': nodes['time'][0],
                                     'Estimated Time': nodes['time'][0]/firstRetweets[0]/np.timedelta64(1,'s'),'Total Retweeted': lastRetweet, 'Retweeted Followers': nodes['retweeted_status.user.followers_count'][3]}, index=[0]), ignore_index=True)
    else:
        retweet = firstRetweets[1]
        time = nodes['time'][1]
        df = df.append(
            pd.DataFrame({'Folder': folder, 'Retweet Count': firstRetweets[1], 'Time Difference': nodes['time'][1],
                          'Estimated Time': nodes['time'][1] / firstRetweets[1] / np.timedelta64(1, 's'),
                          'Total Retweeted': lastRetweet, 'Retweeted Followers': nodes['retweeted_status.user.followers_count'][3]}, index=[0]), ignore_index=True)
    if retweet <= 2 and time <= datetime.timedelta(seconds=10):
        nf = nf.append(
            pd.DataFrame({'Folder': folder, 'Retweet Count': retweet, 'Time Difference': time,
                          'Total Retweeted': lastRetweet,'Retweeted Followers': nodes['retweeted_status.user.followers_count'][3]}, index=[0]), ignore_index=True)
    nf.to_csv('usableTimes.csv', index=False)
    df.to_csv('allTimes.csv', index=False)



