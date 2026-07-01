resource "aws_security_group" "alb" {

  name        = "${var.project_name}-alb-sg"
  description = "Security Group for Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {

    description = "HTTP"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {

    description = "HTTPS"

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }

}

resource "aws_security_group" "node" {

  name   = "${var.project_name}-node-sg"
  vpc_id = var.vpc_id

  ingress {

    description = "HTTP from ALB"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]

  }

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      var.allowed_ssh_ip
    ]

  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {
    Name = "${var.project_name}-node-sg"
  }

}


resource "aws_security_group" "mongo" {

  name   = "${var.project_name}-mongo-sg"
  vpc_id = var.vpc_id

  ingress {

    description = "MongoDB"

    from_port = 27017
    to_port   = 27017

    protocol = "tcp"

    security_groups = [
      aws_security_group.node.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {
    Name = "${var.project_name}-mongo-sg"
  }

}
