import pandas as pd
import os
import numpy as np


ITERATE =['822','826','828','829','830','831','835','839','840','842','845','848','849','853','857','860','862',
          '866','868','870','872','898','941','989','993','1045','1077','1079','1081','1137','1162','1184','1191','1204','1207']

TRIAL = "../data/not/"

#change to all75, bot75, not75, na75 when wanting more certain data
all = pd.read_csv(TRIAL + "/all.csv")
bot = pd.read_csv(TRIAL + "/bot.csv")
nott = pd.read_csv(TRIAL + "/not.csv")
na = pd.read_csv(TRIAL + "/na.csv")

for INDEX in ITERATE:
    print(INDEX)
    DATA = TRIAL + "data" + INDEX + "/node.csv"

    uf = pd.read_csv(TRIAL + "data" + INDEX + "/user_data.csv")
    nf = pd.read_csv(TRIAL + "data" + INDEX + "/node.csv")

    df = nf.merge(uf, left_index=True, right_index=True)

    df['bot_english'] = np.nan
    #Change .5 to .75 if you want more certain data
    df.loc[df['english_score'] >= 0.5, 'bot_english'] = 1
    df.loc[df['english_score'] < 0.5, 'bot_english'] = 0
    df.loc[pd.isnull(df['english_score']), 'bot_english'] = -1

    botTimes = pd.DataFrame(df.loc[df['bot_english'] == 1]["Time Difference"])
    notTimes = pd.DataFrame(df.loc[df['bot_english'] == 0]["Time Difference"])
    naTimes = pd.DataFrame(df.loc[df['bot_english'] == -1]["Time Difference"])

    botCount = pd.DataFrame(df.loc[df['bot_english'] == 1]["retweeted_status.retweet_count"])
    notCount = pd.DataFrame(df.loc[df['bot_english'] == 0]["retweeted_status.retweet_count"])
    naCount = pd.DataFrame(df.loc[df['bot_english'] == -1]["retweeted_status.retweet_count"])

    botCol = pd.merge(botTimes, botCount, left_index=True, right_index=True)
    notCol = pd.merge(notTimes, notCount, left_index=True, right_index=True)
    naCol = pd.merge(naTimes, naCount, left_index=True, right_index=True)

    bot = bot.append(botCol, ignore_index=True)
    nott = nott.append(notCol, ignore_index=True)
    na = na.append(naCol, ignore_index=True)

    df.to_csv(TRIAL + "data" + INDEX + "/new_node.csv")
    print('done')

#Change files to bot75.csv, not75.csv, and na75.csv for botscore of .75/1
bot.to_csv(TRIAL + 'bot.csv')
nott.to_csv(TRIAL + 'not.csv')
na.to_csv(TRIAL + 'na.csv')

