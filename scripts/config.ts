import {promises as fs} from 'fs'
let config:any;
export async function initConfig() {
    console.log('init');
    config = JSON.parse((await fs.readFile('./config.json')).toString());
    return config;
}
export function getConfig(){
    return config;
}
export function setConfig(path: string, value: string){
    console.log(config);
    const splitPath = path.split('.').reverse()
    let ref = config;
    while (splitPath.length > 1){
        let key = splitPath.pop();
        if(key){
            if(!ref[key])
            ref[key] = {};
        ref = ref[key];
        }else{
            return;
        }
    }
    let key = splitPath.pop();
    if(key)
    ref[key] = value;
}
export async function updateConfig() {
    console.log("write: ", JSON.stringify(config, null, 2));
    return fs.writeFile('./config.js', JSON.stringify(config, null, 2));
}