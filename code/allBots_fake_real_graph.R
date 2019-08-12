library(readxl)

fake_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot.xlsx")
fake_not <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_not.xlsx")
fake_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot_na.xlsx")

fake_bot75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot75.xlsx")
fake_not75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_not75.xlsx")
fake_bot_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot_na75.xlsx")

real_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot.xlsx")
real_not <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_not.xlsx")
real_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot_na.xlsx")

real_bot75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot75.xlsx")
real_not75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_not75.xlsx")
real_bot_na75 <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real_bot_na75.xlsx")

#fake bot vs fake not
ggplot() +
  geom_density(data = fake_bot, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = fake_not, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot and Other Users in Misinformation (.5)")

ggplot() +
  geom_density(data = fake_bot75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = fake_not75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot and Other Users in Misinformation (.75)")

#fake bot/na vs fake not
ggplot() +
  geom_density(data = fake_bot_na, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = fake_not, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot/NA and Other Users in Misinformation (.5)")

ggplot() +
  geom_density(data = fake_bot_na75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = fake_not75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot/NA and Other Users in Misinformation (.75)")

#real bot vs real not
ggplot() +
  geom_density(data = real_bot, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_not, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot and Other Users in Other News (.5)")

ggplot() +
  geom_density(data = real_bot75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_not75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot and Other Users in Other News (.75)")

#real bot/na vs real not
ggplot() +
  geom_density(data = real_bot_na, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_not, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot/NA and Other Users in Other News (.5)")

ggplot() +
  geom_density(data = real_bot_na75, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = real_not75, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("RT time of Bot and Other Users in Other News (.75)")
