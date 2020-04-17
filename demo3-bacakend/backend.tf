terraform{
	backend "s3" {
		bucket = "terraform-state-rahul"
		key = "../demo2/"
		region = "us-east-1"
	}
}
