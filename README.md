# rearc-cloud-quest

Note: code written in this repo is for terraform version 0.14.9

Steps to run the app on AWS:

    1. Make sure you change the `provider.tf` file at location `apps/rearc-cloud/` to point to an existing bucker in your account.

    2. Go to location `apps/rearc-cloud` and execute `terraform init`. This will install all the dependencies that the code needs and will setup the env against AWS.

    3. Log into your AWS account by executing `aws configure`, thus making sure you are pointing to the desired account.

    4. From the same location as in step 2, execute `terraform plan --var-file ../../us-east-2.tfvars`. This will create a terraform plan and show you all the resources that will be created.

    5. Once the plan look fine, execute `terraform apply --var-file ../../us-east-2.tfvars`. The command will show you the same plan as in step 4 to make sure you are fine with it. Enter yes when prompted.

    6. Once terraform applies the code, you will get a confirmation of the resources created on AWS.

    7. Go to AWS and look for ec2 instance named `rearc-test-instance`, get it's public IP and navigate to address `<public-ip-you-just-obtained>:3000` via the browser. 



Steps to run the app in a container:

    1. You have a Dockerfile in the root directory of the repo. Create an image using command while in the root location
        `docker build -t rearc:latest .`

    2. Once you have the image, create a container using the image with command `docker run -p 3000:3000 rearc:latest`

    3. Once you get the message `Rearc quest listening on port 3000!`, go to `localhost:3000` using your browser. 

    4. If you see the message `You dont seem to be running in AWS`, you have successfully run the app in a container.
