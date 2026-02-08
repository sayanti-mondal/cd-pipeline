 output "public_ip"{
    value =  aws_instance.terra_instance.public_ip
 }

# output block for for_each
#output "public_ip" {
 #   value = [
  #      for instance in aws_instance.terra_instance : 
   #     instance.public_ip 
    #]
#}


