## Packer AMI-creation for compute environment caching

### Set Up: 

Clone this repo. 
  
#### Edit the image.json file for your deployment: 
The critical items to check:
  * Region - ensure that you've selected the correct AWS region
  * Source AMI - Specify the AMI ID of the AMI which you want to build this on top of.
  * launch_block_device_mappings - You may need to edit this if there are any special storage settings on your deployment
  	* Specifically, the "device_name" needs to match the name for the root volume of the source AMI. "/dev/sda1" in th case of th standard ubuntu AMI or "/dev/xvda" for the standard EKS AMIs. 
 
#### Edit the cache-images.sh file:
The critical items to check:
  * update the compute environment list if you would like ones different than the default 

#### Add your environment variables:
Set:
  * AWS_ACCESS_KEY_ID

  * AWS_SECRET_ACCESS_KEY

### Usage

From the folder containing your image.json and cache.sh file run: 

```
docker run -v $PWD:/packer -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY hashicorp/packer build /packer/image.json 
```
When successful, it will give you your new AMI ID
