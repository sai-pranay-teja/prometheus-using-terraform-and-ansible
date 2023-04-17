env="practise"
vpc-practise={
    main-vpc={
        vpc_cidr="10.0.0.0/24"
        public_subnets={
            name="public_subnet"
            cidr_block="10.0.0.0/28"
            type="t2.micro"
            key="Name"
        }
        private_subnets={
            name="private_subnet"
            cidr_block="10.0.0.16/28"
            type="t2.micro"
            key="Name"
        }
    }
}

tags={
    Course="DevOps"
    job="TCS"
    Emp_name="Pranay"
}




role={
    name="Prometheus_server"
    type="t3a.small"
    spot=false
    role_assigning=true
}

ansible-practise={
    Instance-1={
       name="Instance_1"
       type="t3a.small"
    }
    /* Instance-2={
        name="Instance_2"
        type="t3a.small"
        key="Name"

    } */
}

