library(readxl)

fake_bot <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot.xlsx")
fake_bot_na <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake_bot_na.xlsx")

fake_bot_na$timestamp <- sub(".*31", "", fake_bot_na$`Time Difference`）
                             
plot(ecdf(fake_bot_na$timestamp))
sapply(fake_bot_na$`timestamp`, typeof)                             
fake_bot_na$time <-strptime(x=fake_bot_na$`timestamp`,format="%H：%M:%S")
as.numeric(fake_bot_na$time) %% 86400
plot(ecdf(as.numeric(fake_bot_na$time)))
