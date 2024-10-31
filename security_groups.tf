resource "aws_security_group" "main" {
  name   = format(("%s"), var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1" #-1 são todos os protocolos
    cidr_blocks = [
      "0.0.0.0/0" #libera todo o tráfico de saída
    ]
  }
}

resource "aws_security_group_rule" "subnet_ranges" {
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["10.0.0.0/16"] #libera tráfego para tudo que vier da VPC
  description       = "Liberando trafego para a VPC"
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  type              = "ingress"
}

