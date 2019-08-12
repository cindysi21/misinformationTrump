library(readxl)

fake_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot.xlsx")
fake_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot_na.xlsx")

fake_bot75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot75.xlsx")
fake_bot_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot_na75.xlsx")

real_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot.xlsx")
real_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot_na.xlsx")

real_bot75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot75.xlsx")
real_bot_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot_na75.xlsx")

#fake bot vs real bot
ggplot() +
  geom_density(data = fake_bot, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_bot, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot Users in Fake/Other News(.5)")

ggplot() +
  geom_density(data = fake_bot75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_bot75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot Users in Fake/Other News(.75)")

#fake bot/na vs real bot/na
ggplot() +
  geom_density(data = fake_bot_na, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_bot_na, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot/NA Users in Fake/Other News(.5)")

ggplot() +
  geom_density(data = fake_bot_na75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_bot_na75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot/NA Users in Fake/Other News(.75)")
