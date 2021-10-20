function titleize(names, callback) {
    let new_arr = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    new_arr.forEach(element => {
        callback(element);
    });
}

function callback(param) {
    console.log(param);
} 

//can be converted into class method 
function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
};


Elephant.prototype.grow = function () {
    this.height += 12 
}


Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick)
}

Elephant.prototype.play = function () {
    function getRandomArbitrary(min, max) {
        return Math.random() * (max - min) + min;
    }

    let randomTrickNum = getRandomArbitrary(0, this.tricks.length);
    let trick = this.tricks[randomTrickNum]
    console.log(`${this.name} is ${trick}`);
}
