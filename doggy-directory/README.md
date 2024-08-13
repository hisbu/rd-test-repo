# readme

- This webapp sample uses the react js framework, so these are the tools we use in this pipeline:
    - unit testing using jest
    - linter using eslint
    - formatting using prettier
- the pipeline is divided into 3 stages,
--> test --> build --> deploy to s3

![Screenshot 2024-08-13 at 21.40.30.png](readme%208869bd5d427e42c192d35dd63dcb37c7/Screenshot_2024-08-13_at_21.40.30.png)

- pipeline triggers based on pull requests to the branch master,
- because heroku free tier has depreciated since 2022, so the webapp build results are deployed to AWS S3 static web.

> Here is the link to the aws s3 static web:
[http://sample-web-upload.s3-website-ap-southeast-1.amazonaws.com](http://sample-web-upload.s3-website-ap-southeast-1.amazonaws.com/)
> 

![Screenshot 2024-08-13 at 21.42.46.png](readme%208869bd5d427e42c192d35dd63dcb37c7/Screenshot_2024-08-13_at_21.42.46.png)