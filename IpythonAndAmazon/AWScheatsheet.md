##List buckets

*aws s3 ls*

##Copy files between two locations

*aws s3 cp POS1 POS2*

http://docs.aws.amazon.com/cli/latest/reference/s3/cp.html

##Move files between two locations

*aws s3 mv POS1 POS1

http://docs.aws.amazon.com/cli/latest/reference/s3/mv.html

##Sync data between two locations

*aws s3 sync POS1 POS2*

##Remove all files

*aws s3 rm s3://BUCKET --recursive*

http://docs.aws.amazon.com/cli/latest/reference/s3/rm.html

##Make a new bucket

*aws s3 mb s3://BUCKET*

http://docs.aws.amazon.com/cli/latest/reference/s3/mb.html

##Delete a bucket

*aws s3 rm s3://BUCKET*

http://docs.aws.amazon.com/cli/latest/reference/s3/rb.html

