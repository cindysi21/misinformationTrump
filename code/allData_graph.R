library(readxl)

all_fake <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_fake.xlsx")
all_real <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_real.xlsx")

all_v_fake <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_fake.xlsx")
all_v_real <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/all_verified_real.xlsx")

#fake news, other vs retweet time (all)
ggplot() +
  geom_density(data = all_fake, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = all_real, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet time of all Fake News vs Other News")

#fake news, other vs retweet time (useful)
ggplot() +
  geom_density(data = all_v_fake, aes(x=`Time Difference`),
               fill = 'red', color = "black", alpha = 0.6)+
  geom_density(data = all_v_real, aes(x=`Time Difference`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Retweet time of Useable Fake News vs Other News")
