# SDKSure
SDKSure is a scalable testing and validation framework designed to ensure the quality, stability, and reliability of SDKs on SoCs.

## Cloning the Repository

To clone this repository along with all submodules, use the following command:

```
git clone --recurse-submodules https://github.com/Rajsoni03/SDKSure.git
```

If you have already cloned the repository without submodules, you can initialize and update them with:

```
git submodule update --init --recursive
```

## Developement Setup

### Backend
```
cd SDKSureBackend
source venv/bin/activate
pip install -r requirements.txt

python manage.py runserver
```

### Frontend
```
cd SDKSureFrontend/
npm install

npm run dev
```

