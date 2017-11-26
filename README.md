# DalhousieHackathon2017
A Dalhousie & ShiftKey Labs hosted Hackathon, which took place on Nov. 25th 2017. The hackathon was limited to first and second year undergraduates and ran from 10am until 8pm. Our team consisted of [myself](https://github.com/mackboudreau) and [@sterrio](https://github.com/sterrio).

## Brainstorming
To start off this hackathon, we brainstormed problems everyone had and corresponding solutions. After coming up with various ideas, we choose an app that helps people stay healthy.
We choose this because we feel that this is a problem that impacts almost everyone. It’s extremely challenging to eat healthy all the time, and it’s even harder when you don’t know exactly how many calories you should be intaking daily.  

So what exactly was our solution? An app that tracks calories easily... that “easily” part was very important to us, because we know that there are already lots of excellent solutions out there to track your calories/nutrition information. 

Our absolute-ideal-vision would be where people can take out their phone before eating, hold it up to the food, and voila! It stored the amount of calories that the food contained and it updated the amount of calories you should take in for the rest of the day.

## Getting Ready
Before writing any code, we wanted to have a clear understanding of how our app should function, so there wasn’t any confusion down the road. To accomplish this, we choose to design our UI first. Instead of starting with wireframing and then moving on to a detailed mockup, I jumped straight into the mockup. 

Here is what I ended with, which I was moderately satisfied with (as time went on I liked it less & less…)
<p align="center"><img src="https://i.imgur.com/cxZoWv9.png" height="400px"></img><img src="https://i.imgur.com/Xi73O9W.jpg" height="400px"></img><img src="https://i.imgur.com/MLUtaub.png" height="400px"></img></p>

## Building
Building the app seemed very straight forward, as we chose to use a pre-trained model for image recognition and then use some REST API to get the # of calories. We decided to take this route as we were limited in time, and we knew that this would produce better results than we could achieve.

#### iOS App
The iOS app was written in swift. It consists of two 'pages', the first being a AVCaptureSession and the next being a UITableView. Each of these 'pages' were contained within a UICollectionView, so that the user can swipe between them. 

#### Image Recognition
Image recognition was done using CoreML & MobileNet. CoreML is a newly released library from apple, to implement trained machine learning models that can be ran directly on the device. MobileNet is a convolutionary neural network designed and trained by Google. 

#### REST API?
As for the REST API, we had plans to use fatsecret.com. Sadly though, we couldn't get it implemented in time. It used OAuth 1.0 for authentication and neither of us have had experience with OAuth, so we made the decision to just use a basic dictionary/hashmap to store the values and sort of simulate a database. I believe this was a good decision, because during our presentation, it was virtually impossible to tell a difference (had we not told the audience we hadn't implemented an API).

## Issues
Surprissingly, our biggest issue was... github. I've been using this platform frequently for 4-5 months at the time of writing this, although I've almost always used it for personal/solo projects. Having another person commiting over my code, resulted in a sea of merge conflicts which I had no experience fixing. It got to the point where I was scared to commit anything until the competition was finished. This is definitally something I need to work on.

## The Outcome
There were 3 categories to win... Most Humorous, Most Social, and Most Complete. The winners were chosen by all the other teams. We ended up winning "Most Complete", which was great!

## Future
If we were to take this app further, we would definitally hook it up to an API so we can cover more food. As well as train our own model that only detects various foods (MobileNet wasn't specifically designed for food). Finally, we believe that experimenting with depth-sensor cameras may prove better results, not only for classification, but also predicting the portion size of the food to get a more accurate calorie reading. 
