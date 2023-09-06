# Cloud Computing 

##  Goal 
    To understand Cloud Computing with a focus in AWS
## Methodology 
    1) Read the provided text
    2) Further research the topic
    3) Solve the Challanges 
    4) Merge what is done in this chapter with chapter 9 
## Handwritten Notes 

## Challenges 

Let's get to work! you will find some tasks in this section where you can practice what we learned on this chapter

Log into AWS management console with your training account, if you don't have one please reach out to your trainer, 
he should be able to give you the credentials or the name of the person who can help you with this.

### Cloud Infrastructure diagramming

Before we start working on AWS, your first task will be making a Diagram about how your cloud infrastructure will be for
running your application with High Availability using all the components we saw on this chapter, you can use the tool of
your choice, like draw.io, Microsoft Visio, etc. 

Use the AWS Calculator to create an estimate of how much this cloud infrastructure will cost monthly.
https://calculator.aws/#/

Once you finish the diagram, show it to your trainer and discuss together about how you will implement this infrastructure and why you decided to use each component of your infrastructure.

### Running your App with EC2 Instances

First, let's get a little warmed up with AWS running your app with only EC2 Instances, just as we did on the previous chapter
with Vagrant:

**1.** Create two EC2 Instances, just as we did with vagrant, one for the backend, another for the frontend.

**2.** Choose the AMI (OS) you want to use on your instance, We suggest using Amazon Linux 2 or Ubuntu.

**3.** Create a new EC2 Instance to work as your **bastion host**. This will be used to access through SSH to your private instances and the access must be allowed only from your IP.

**4.** Set up your instances so your backend instance belongs to a private subnet and the frontend belongs to a public
subnet, that way your instances should be able to communicate, but you shouldn't be able to log in through ssh to your
backend instance (you can access to it through your **bastion** instance logging in through ssh to your **backend** instance).

**5.** Provision your instances and run your application just as you did on the previous chapter while provisioning your Virtual Machines.

**6.** Check that your app is running and try to access it through the public IP and port you assigned for the frontend, double check that
everything is running ok.

### Running your App with High Availability

Now that you warmed up let's start with a High Availability infrastructure! now you need to build the same infrastructure you designed on
the diagram, with Auto Scaling groups, Load balancers, Launch templates, and Target groups. To do so, please create a new version of your diagram using all these AWS resources and present it to your trainer.

You need to configure your Auto Scaling group for provision automatically your frontend and backend instances. Each time an instance is
created, it has to be able to configure itself and run your application without you to move a single finger. Once you finish creating
your Auto Scaling group, verify that your app is running ok and then delete one instance of your Auto Scaling group and check if its
created again and being provisioned correctly so your app keeps working even if an instance gets down.

Once you created the load balancers, create a rule for redirecting a request from port 80 of your frontend instance and sending it
to your application's home page directly without needing to add the port on the browser's url.

**BONUS:** It will be great if you can show your app running correctly on port 443 and using a valid certificate (you can use cerbot). If you do it, remove the access to port 80 and send all requests to 443.

## Cloud Infrastructure diagramming

<p align="center">
    <img style = "width:750px" src="imgs/diagrams/aws_structure final.png">
</p>


