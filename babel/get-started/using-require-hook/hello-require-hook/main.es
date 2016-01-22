//import Promise from 'bluebird'

async function asyncTest(value) {
    if (value > 10) throw new Error('test-test');
    return value;
}

export async function asyncMain() {
    try {
        for (var i=0; i<100; i++) {
            console.log(await asyncTest(i));
        }
    } catch (err) {
        console.error(err.stack);
    }
}
