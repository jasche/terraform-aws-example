provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source        = "github.com/turnbullpublishing/tf_vpc.git?ref=v0.0.1"
  name          = "web"
  cidr          = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}

resource "aws_iam_server_certificate" "web_cert" {
  name = "web_cert"

  certificate_body = <<EOF
-----BEGIN CERTIFICATE-----
MIIDwDCCAqgCCQDha2TXGOR1MTANBgkqhkiG9w0BAQsFADCBoTELMAkGA1UEBhMC
REUxDDAKBgNVBAgMA05SVzEPMA0GA1UEBwwGVGVsZ3RlMRQwEgYDVQQKDAtEZXZl
bG9wbWVudDENMAsGA1UECwwEVGVzdDEeMBwGA1UEAwwVSnVlcmdlbiBBc2NoZW5i
cmVubmVyMS4wLAYJKoZIhvcNAQkBFh9qdWVyZ2VuLmFzY2hlbmJyZW5uZXJAZ21h
aWwuY29tMB4XDTE3MDMzMDE0NTc0NVoXDTE4MDMzMDE0NTc0NVowgaExCzAJBgNV
BAYTAkRFMQwwCgYDVQQIDANOUlcxDzANBgNVBAcMBlRlbGd0ZTEUMBIGA1UECgwL
RGV2ZWxvcG1lbnQxDTALBgNVBAsMBFRlc3QxHjAcBgNVBAMMFUp1ZXJnZW4gQXNj
aGVuYnJlbm5lcjEuMCwGCSqGSIb3DQEJARYfanVlcmdlbi5hc2NoZW5icmVubmVy
QGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeqFIBk
FuZt6UmE/2XJpJJI0msxw4kOwlF92t2WWcyJuU3X1MQ5R0qUIldMzKl+mAumgxTf
cUxQjffI11r+3QCLTI5GlOM/qhKzoI6/AT2PfvA5scesxSBNcm9HJ5eaNL95eJmD
rFxtFFb49lW9xNz3K83aHAOuaYQciz03kYWv6WuW+CDjtSG18SQDx3Q1EYpqN/ju
9DuGMuU6nU0z0HA7mXXUYyIpZ7oAA7Q5QeV7T8esa2L0hL4jfV6HcHZL8jbDqJvY
I+auGpGM+szAC0G3Je4rYGX2OoKMuz3uFIaXX9cw6WutKTpeJ7kdv131ocWdc5HY
P4e4df7XpzfmjYkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAo2JBBIJWKim/+XTc
RZ/umJy91pG5fH0zlUcr5yTr3YKYSTwoMorKudICsCie7V8VzAQR6HEFDkBncZx0
mw/c+zSVzt19rTTchacXra0SzJh3EEdLYCAzIOiZoMv3DcPLAVoeI24TbYNeq5OW
RdEhxHwuCJhqAUi0sQ8VEOqc4W/LVuXXJPvsLpBIwFE7a/4RcZBScFLnp6B/CJxO
E0hDdDecya22vPt9zKeJPaNDtUqJB4hfPLW5/A9F8DO9KQCxS4vaLdjiPvpCPylz
rG/lwvddGCyeYzyPV9GHFAqvMF+IsTxlOhAwgF4JSU1szirsskYaIaKnMlFbNs/6
KPQQrA==
-----END CERTIFICATE-----
EOF

  private_key = <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAx6oUgGQW5m3pSYT/ZcmkkkjSazHDiQ7CUX3a3ZZZzIm5TdfU
xDlHSpQiV0zMqX6YC6aDFN9xTFCN98jXWv7dAItMjkaU4z+qErOgjr8BPY9+8Dmx
x6zFIE1yb0cnl5o0v3l4mYOsXG0UVvj2Vb3E3PcrzdocA65phByLPTeRha/pa5b4
IOO1IbXxJAPHdDURimo3+O70O4Yy5TqdTTPQcDuZddRjIilnugADtDlB5XtPx6xr
YvSEviN9XodwdkvyNsOom9gj5q4akYz6zMALQbcl7itgZfY6goy7Pe4Uhpdf1zDp
a60pOl4nuR2/XfWhxZ1zkdg/h7h1/tenN+aNiQIDAQABAoIBAGepzF8kmCcnJZoA
LUHBwWoZ2PXCroy4VvdMapfledYSI11hE5yVSIhWBMZin1fY3EQgPapWoFJI+IyP
gBBEhqXDrQmpZ5/c7AYtsMysKo61s+gxbDYJY4dz7lgMD2hMrdpDzPOXQ6PxFkBZ
njvB/TXkNp/3/9eBdFMdJsWv1iQb10dyQrjikfpZV19ERTMlniPwWgWITDRY2ClB
+VIC639QlmN/YJCcX1YhQW96YKK6B7YVsVH3rJAtTAvXGB8UW5tUpQw5iZxwMO4v
unh7+uF10y6EVBB2BKOAA1fYpi5Ffw1brLKyOPoouYGCENHz9TkGZyyoYXduXtR5
FKbs4QECgYEA9+/gR9Eh82NY/vELxGu/5bYW/zPP7ilCQZ0cvcgVIJU4RV0lEdVF
qpvLoNZ+aOEvAsl1iqKPiiz6NWPpW8/azsDGGIJ+xKQOChMrHLCugenrzlnGiY7g
Ittx4qcWNuR7MrLPrzOcYiZgPAqFR0iDVeMtHQ4JnwAtLLHOGMlzOfECgYEAzihT
Khxn247RlHb8QG4zlddQ2DZVtSg2J8Rr61E0bxrrFunUSdJplcP2H6jHnz3owmvi
OejRsQ/gMdX3/RmM4W+Eq35fVQNiA5hk5viNrn+9V+DHG98Pjbe2UtmIciDXS3iY
GsRvXhcQU3Yr3sBgzXbxkBPy4AfS3UzMGDwXNRkCgYEAkncPG/3MO5Z1zW0iEW/B
lfbCkRHPhJa1AEPK5cXbzTq5WiiTLHy7wfR1D1eGp3hXKCNQn4w2lV7KlF2oTkd0
r+yrWXFFZ+6uKH94WWN6Q16noWfhZAOWHqFaHpWsBtNkf+enzo0Dleurr+xbHWgV
xdgFH4PaZSZaiWukH3pp6lECgYEAhWeQ0XpKNsjHlEQe3e6yEO+hUBhxA+Z+jONN
VpxYyuDnag9sIU04qAKD/V6xtrlQKqe3X/Pp5aM5V+Z3MGBdSvBoMLV5KUEkJuFx
wgjrXhUpSHmbPszseq98G0bLRdc8mojyHLgqvP89wFSC9QUWXz7t+GcATrqhWDU/
CRuxhNkCgYEAzwLwgXr+3Lj2FVHbWTcgme69dUKBin/4qozw5c3Hkat73XON+tx2
kuLL3mIwUarxoVYEyR84f/9dDenBU7RfX5cUci/J0O6EKjAyzodULxpV4tSGnEP/
Y6Spiq4hTnD8DeDvKTdzOyTlULiOPykOQz977ck+V5K6Q/VzCsf4m24=
-----END RSA PRIVATE KEY-----
EOF
}

resource "aws_instance" "web" {
  ami                         = "${lookup(var.ami, var.region)}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${module.vpc.public_subnet_id}"
  private_ip                  = "${var.instance_ips[count.index]}"
  associate_public_ip_address = true

  vpc_security_group_ids = [
    "${aws_security_group.web_host_sg.id}",
  ]

  tags {
    Name = "web-${format("%03d", count.index + 1)}"
  }

  count = "${length(var.instance_ips)}"


  connection {
    user        = "ubuntu"
    private_key = "${file(var.key_path)}"
  }


  provisioner "file" {
    source      = "files/http-server.py"
    destination = "/home/ubuntu/http-server.py"

  }

  provisioner "file" {
    source      = "files/https-server.py"
    destination = "/home/ubuntu/https-server.py"

  }

  provisioner "file" {
    source      = "files/domain.pem"
    destination = "/home/ubuntu/domain.pem"

  }

  provisioner "file" {
    source      = "files/index.html"
    destination = "/home/ubuntu/index.html"

  }


  provisioner "remote-exec" {
    script = "files/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
	"nohup sudo python http-server.py 2>&1 >/dev/null &",
	"nohup sudo  python https-server.py 2>&1 >/dev/null &",
        "sleep 1"

   ]
  }


}

resource "aws_elb" "web" {
  name = "web-elb"

  subnets         = ["${module.vpc.public_subnet_id}"]
  security_groups = ["${aws_security_group.web_inbound_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 4443
#    instance_protocol  = "https"
    instance_protocol  = "tcp"
    lb_port            = 443
    lb_protocol ="tcp"
#    lb_protocol        = "https"
#    ssl_certificate_id = "${aws_iam_server_certificate.web_cert.arn}"
  }
  # The instances are registered automatically
  instances = ["${aws_instance.web.*.id}"]
}

resource "aws_security_group" "web_inbound_sg" {
  name        = "web_inbound"
  description = "Allow HTTP from Anywhere"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4443
    to_port     = 4443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_host_sg" {
  name        = "web_host"
  description = "Allow SSH & HTTP to web hosts"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${module.vpc.cidr}"]
  }

 # HTTPS access from the VPC
  ingress {
    from_port   = 4443
    to_port     = 4443
    protocol    = "tcp"
    cidr_blocks = ["${module.vpc.cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
