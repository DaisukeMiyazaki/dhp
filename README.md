# Dream House Project

This is a repository for site: DreamHouseProject.
Currenly live on https://d3i2axt7bkh5tc.cloudfront.net/index.html

# Tech Stack

This repository is designed to use out of the box with scripts for data preparation, static site generation as well as deployment to your site.

1. You place your photos you want to share with the world under /images/pre_published
2. Run a script that convert the images under /images/pre_published/ to thumbnails and move them to /images/original as well as /images/thumbnail

3. Run a script to update an index.html that reflects all /images/original/ as well as /images/thumbnail/. 
4. Run a script that deploys all the photos except /images/pre_published/ to s3.

Now you're site is live on https://your_cloud_front_url/index.html

# Advantage of this site
1. No server needs to run nor deployed to cloud, which can cut the cost of cloud and compute. (At the end of the day, no need to run a server if there's no request coming)
2. Custom javascript can run on the client site to do necessary frontend stuff.
3. Cost on cloud service only happens for your image storage and traffic as it should.


# What Not To Do In This Repository
I'd like to keep this repository as minimun as possible to a static HTML page for the site. No server deployment is aimed because that introduces another complex layer, such as preparing a hardware machine like EC2, installing OS and a server etc.

# Contibution
Any contibution such as issues, Pull requests are all welcome!