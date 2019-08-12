library(readxl)

all_bot75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_bot75.xlsx")
all_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_bot.xlsx")
all_not75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_not75.xlsx")
all_not <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_not.xlsx")
all_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_na75.xlsx")
all_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_na.xlsx")
all_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_bot_na.xlsx")
all_bot_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_bot_na_75.xlsx")

#bot, not vs retweet time
ggplot() +
  geom_density(data = all_bot, aes(x = `Time Difference`), 
               fill = "red", color = "black", alpha = 0.7) +
  geom_density(data = all_not, aes(x = `Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet Time of Bot vs Other Users (.5)") 

ggplot() +
  geom_density(data = all_bot75, aes(x = `Time Difference`), 
               fill = "red", color = "black", alpha = 0.7) +
  geom_density(data = all_not75, aes(x = `Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet Time of Bot vs Other Users (.75)")

#bot/na, not vs retweet time
ggplot() +
  geom_density(data = all_bot_na, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = all_not, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet Time of Bot/Na vs Other Users (.5)")

ggplot() +
  geom_density(data = all_bot_na75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = all_not75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet Time of Bot/Na vs Other Users (.75)")
