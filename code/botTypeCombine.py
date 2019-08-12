import pandas as pd
import os
import numpy as np

#Divides users by bot, not, and na
ITERATE = ['986']

TRIAL = "../data/fake1/"

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

    botCount = pd.DataFrame(df.loc[df['bot_english'] == 1]["user.screen_name"])
    notCount = pd.DataFrame(df.loc[df['bot_english'] == 0]["user.screen_name"])
    naCount = pd.DataFrame(df.loc[df['bot_english'] == -1]["user.screen_name"])

    bot = pd.merge(botTimes, botCount, left_index=True, right_index=True)
    nott = pd.merge(notTimes, notCount, left_index=True, right_index=True)
    na = pd.merge(naTimes, naCount, left_index=True, right_index=True)

    df.to_csv(TRIAL + "data" + INDEX + "/new_node.csv")
    print('done')

#Change files to bot75.csv, not75.csv, and na75.csv for botscore of .75/1
bot.to_csv(TRIAL  + 'bot.csv')
nott.to_csv(TRIAL + 'not.csv')
na.to_csv(TRIAL + 'na.csv')

