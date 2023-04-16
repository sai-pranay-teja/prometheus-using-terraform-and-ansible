vpc-practise={
    main-vpc={
        vpc_cidr="10.0.0.0/24"
        public_subnets={
                name="subnet-1"
                cidr_block="10.0.0.0/28"
        }
        private_subnets={
                name="subnet-1"
                cidr_block="10.0.0.16/28"
        }
    }
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
       key="Name"
    }
    /* Instance-2={
        name="Instance_2"
        type="t3a.small"
        key="Name"

    } */
}

