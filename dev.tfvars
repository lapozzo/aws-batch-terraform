compute_envs = {
        "ec2":{
            "name": "on_demand",
            "type": "EC2",
            "instance_type": ["optimal"],
            "allocation_strategy": "BEST_FIT"
        },
        "spot":{
            "name": "spot",
            "type": "SPOT",
            "instance_type": ["optimal"],
            "allocation_strategy": "SPOT_CAPACITY_OPTIMIZED"
        },
        "fargate":{
            "name": "serverless",
            "type": "FARGATE",
            "instance_type": null,
            "allocation_strategy": null
        }
    }