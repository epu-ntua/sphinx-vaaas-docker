db.auth('admin', 'admin');
// // console.log(process.env.MONGO_INITDB_ROOT_USERNAME);
// // console.log("------------------------------------------");
// db = db.getSiblingDB('api_prod_db');

db = db.getSiblingDB('vaaas');
db.createUser(
    {
        user: 'vaaas',
        pwd: 'vaaas',
        roles: [
            {role: 'readWrite', db: 'vaaas'},
            {role: "dbAdmin", db: "vaaas"},
            {role: "dbOwner", db: "vaaas"},
            {role: "userAdmin", db: "vaaas"},
        ]
    });
db.createCollection('entity');
