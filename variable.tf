variable "bucketname" {
  description = "Bucket name"
  default = "new-s3-tired-but-not-lucked"
}

variable "bucket_object_source" {
    description = "Bucket object source"
    type        = string
    default = "index.html"
} 

variable "bucket_object_source1" {
  description = "New"
  default = "omsd (1).jpg"
}

