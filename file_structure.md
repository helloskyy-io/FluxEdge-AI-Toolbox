AI-Toolbox/
├── ansible/
│   ├── inventories/
│   │   └── ...
│   ├── playbooks/
│   │   └── ...
│   ├── roles/
│   │   └── ...
│   ├── vars/
│   │   └── global.yml  # Global variables are stored here
│   └── ansible.cfg
│
├── bash/
│
├── deployments/
│   ├── benchmarks/
│   │   ├── mlperf_storage/
│   │   │   ├── mlperf_storage.yml
│   │   │   └── dockerfile
│   │   ├── mlperf_training/
│   │   ├── mlperf_inference/
│   │   └── ...
│   ├── detectron2/
│   │   └── ...
│   └── ...
│       └── ...
└── ....

/fluxedge-deployment-toolbox
├── ansible/
│   ├── inventories                             (defines local host only)
│   ├── playbooks                               (Various entrypoints specific to a deployment)
│   ├── roles                                   (Generic reusable OoP components specific to a single configuration task)
│   ├── vars                                    (global ansible vars)
│   └── ansible.cfg                             (edit me later)
│
├── bash/
│
├── deployments
│   ├── ubuntu_22.04
│   │   ├── deployment_configs/                 (yml based deployment files)
│   │   │   ├── argo_cd/                        (Base requirements file for initial dependency resolution)
│   │   │   ├── base/                           (Base files for deployment and service)
│   │   │   └── overlay/                        (Environment-specific patches)
│   │   ├── environment/                        (Configure environment and dependencies)
│   │   │   ├── requirements.txt                (Base requirements file for initial dependency resolution)
│   │   │   └── environment.yml                 (Conda env recipe, for reproducing env)
│   │   ├── python
│   │   │   └── deployment_recipe.py            (edit me later)
│   │   ├── test-suite/                         (Automated testing scripts)
│   │   │   └── testsuite.py                    (edit me later)
│   │   ├── README.md                           (Specific to this deployment, also rendered in UI)
│   │   ├── Dockerfile                          (Base Ubuntu + additional configs)
│   │   ├── deployment-script.sh                (Handles env setup, GPU testing)
│   │   └── test-suite/                         (Automated testing scripts)
│   ├── pytorch_xxx
│   │   ├── README.md
│   │   ├── Dockerfile
│   │   ├── deployment-script.sh
│   │   └── test-suite/
│
├── python
│   └── tbd.py (edit me later)
├── scripts
│   └── shared-utils.sh (Shared functions for deployments)
│
├── file_structure.md (Provides breakdown of directory)
└── README.md (Explains the framework and usage)
