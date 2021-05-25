# Setup the example application

### Step 1: Create a `PayAsYouGo` IBM Cloud Account

### Step 2: Logon to IBM Cloud and navigate to the Code Engine projects

Use following link to directly navigate to the Code Engine projects in IBM Cloud.

<https://cloud.ibm.com/codeengine/projects>

### Step 2: Create a `Code Engine` project called `cloud-native-starter`

1. Press create

![](images/cns-ce-create-project-01.png)

2. Enter following values and select create

* Location      : `Dallas`
* Name          : `cloud-native-starter`
* Resource group: `default`

![](images/cns-ce-create-project.png)


### Step 3: Clone the GitHub project to the `IBM Cloud Shell`

1. Use following link to directly open the `IBM Cloud Shell`.

<https://cloud.ibm.com/shell>

2. Insert these commands to clone the GitHub project to the `IBM Cloud Shell`

```sh
git clone https://github.com/...
cd ce-cns
ROOT_FOLDER=$(pwd)
```

### Step 4: Execute following bash automation

```sh
cd CE
bash ce-deploy-apps.sh
```