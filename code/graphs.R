library(readxl)

df <- read_excel("C:/Users/cindy/Documents/viz/trial2/data1/paper_graphs.xlsx")

View(df)
#Graphs from the paper
ggplot() + 
  geom_density(data = df, aes(x=`ListedFake`),
               fill = 'red', color='black', alpha = 0.5) + 
  geom_density(data = df, aes(x=`ListedNot`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Density Distrbution of Listed Count") 

ggplot() + 
  geom_density(data = df, aes(x=`FollowFake`),
               fill = 'red', color='black', alpha = 0.5) + 
  geom_density(data = df, aes(x=`FollowNot`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Density Distrbution of Followers Count")


ggplot() + 
  geom_density(data = df, aes(x=`FriendFake`),
               fill = 'red', color='black', alpha = 0.5) + 
  geom_density(data = df, aes(x=`FriendNot`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Density Distrbution of Friends Count")

ggplot() + 
  geom_density(data = df, aes(x=`FaveFake`),
               fill = 'red', color='black', alpha = 0.5) + 
  geom_density(data = df, aes(x=`FaveNot`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Density Distrbution of Favorites Count")

ggplot() + 
  geom_density(data = df, aes(x=`StatusFake`),
               fill = 'red', color='black', alpha = 0.5) + 
  geom_density(data = df, aes(x=`StatusNot1`), 
               fill = "light blue", color = "black", alpha = 0.7) +
  ggtitle("Density Distrbution of Status Count")
