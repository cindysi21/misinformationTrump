import botometer
import pandas as pd
import os

#Grab Bot Scores

os.chdir("../data/fake1")

mashape_key = "4ff3b045fcmshd8a184aa9daef57p1bfe42jsnb14b4c2dad83"  # now it's called rapidapi key
twitter_app_auth = {
    'consumer_key': 'rUL7l0RB68bzBQMRpXMg63jdn',
    'consumer_secret': 'pWPAlifKLdpjMYDnqnTi4R8v0Uv7WTJjhsD4tVHhr6xEw4fl4j',
    'access_token': '589408945-Qn2sNKzHZHBdI0Ukgm3eVxvJwU7264WIFyhHmzjo',
    'access_token_secret': 'C6CyX1fx4L8qsDtGpG6DVRRxg2PgxgirxvrHnkdoA6nxL',
  }

botometer_api_url = 'https://botometer-pro.p.mashape.com'
bom = botometer.Botometer(botometer_api_url=botometer_api_url,
                          wait_on_ratelimit=True,
                          mashape_key=mashape_key,
                          **twitter_app_auth)
DATA = ['1127', '986']

for INDEX in DATA:
    COUNT = 1
    DATA = "data" + INDEX + "/export.csv"

    df = pd.read_csv("data" + INDEX + "/user_data.csv")
    df["user_id"] = df["user_id"].astype('str')

    bf = pd.read_csv(DATA)
    accounts = bf["user.id"]

    users = set(df["user_id"])

    results = pd.DataFrame(columns=["user_id", "cap", "content_score", "friend_score",
                                    "network_score", "sentiment_score", "english_score", "universal_score"])


    total = len(accounts)
    for account in accounts:
            if COUNT == 10000:
                df.to_csv("data" + INDEX + "/user_data_half.csv")               #failsafe to save information
            try:
                result = bom.check_account(account)
                add = {"user_id": str(account), "cap": result["cap"]["universal"],
                       "content_score": result["display_scores"]["content"], "friend_score": result["display_scores"]["friend"],
                       "network_score": result["display_scores"]["network"], "sentiment_score": result["display_scores"]["sentiment"],
                       "english_score": result["scores"]["english"], "universal_score": result["scores"]["universal"]}
                df = df.append(add, ignore_index=True)
            except:
                add = {"user_id": account}
                df = df.append(add, ignore_index=True)
            finally:
                print(COUNT,"/",total)
                COUNT += 1

    print("done w/ ", INDEX)
    df["user_id"] = df["user_id"].astype('str')

    os.remove("data" + INDEX + "/user_data.csv")
    df.to_csv("data" + INDEX + "/user_data.csv", index=False, header=True)


