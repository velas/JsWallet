![Logo](https://content.screencast.com/users/a.stegno/folders/Jing/media/4ce9b968-547c-4372-9a02-b5c0ef34d9ff/00000460.png)

This library is created for people who understands the efficiency of React and beauty of Pug. It transforms pug syntax into LiveScript, CoffeeScript syntax which can be processed by React.

### Motivation
* Pug syntax is awesome but it is very hard to use it with React.
* Coffee, LiveScript languages are awesome but there is no isomorphic way to use React with it.
* We just love to build great things as compact as possible.
* Use functional benefits. Do not use OOP anymore. Think decentralized. This functional. Be smart.
* Consider React code as simple back-end.
* We have a lot of thinking how to extend it (SASS, modules)
* Forget about `{` and `}` forever. Use benefits of indented language.
* We will support `coffee`.

You ask `So why it is better then Standartlone React?`

```
Did you know about AngularJS? It uses another approach. 
You can build efficient templates based on SASS + Pug and just inject AngularJS into them.
Unfortunetely it is not possible with React. 

`reactify-ls` makes it possible. 

It gets benefits of both world and combine them into one powerful machine.
Most of companies of SF use React right now. 
And they will be not be able to ingore `reactify-ls` when we get the sufficient level of quality state.
It is just future. React will have to evolve into something next. This is evolution of React. 
```



### Example (TODO list) using Mobx + React

```Livescript
require! {
  \mobx-react : { observer }
  \mobx : { observable }
  \react-dom : { render }
  \react
}

.btn
  color: red
  padding-left: 5px
  &:hover
    color: orange
  

btn = ({click, text})->
    a.pug.btn(target='blank' on-click=click) #{text} 

input = ({store})->
  handle-enter-click = (event) -> 
    return if event.key-code isnt 13 
    store.todos.push text: event.target.value
    event.target.value = ''
  input.pug(on-key-down=handle-enter-click)  

Main = observer ({store})->
  remove = (todo, _)-->
      index = store.todos.index-of todo
      return if index < 0
      store.todos.splice 1, index
  .pug
    h3.pug Tasks
    for todo in store.todos
      .pug 
        span.pug #{todo.text}
        span.pug
          btn {text: 'Remove', click: remove todo}
    input {store}
    hr.pug 
    

window.onload = ->
  store = observable do
      todos:
        * text: 'Do dishes'
        ...
  render do
    Main.pug(store=store)
    document.body.append-child document.create-element \app
```
Notice! You will be able to create a `react function` and use it's `element`


### Install 
```
npm i reactify-ls lscx --save
```

#### Need to have for demo
```
npm i react react-dom mobx mobx-react --save
```

### How to compile 

```Bash
lscx -skhbc your_example

# created your_example.js  - js version of component 
# created bundle.js        - react + app 
# created style.sass       - generated sass
# created style.css        - generated css from sass
# created index.html       - demo page (includes style.css, bundle.js)

```

### Additional Features
* Create basic components modules (customized design)
* Add syntax support into Sublime, Atom
* Support `coffee` and different indented languages like (F#, OCaml, closure, ClosureScript, etc)


### Please support this project (GCCF)

#### Goal 

$ 50 000

### Whitepaper 
Each year you meet new IT trends. Previously it was Jquery, then AngularJS and now it is React. What the next?

We are experienced developers who watch world trends of IT technologies and try to forecast the next big popular thing. 
We are trying to implement it before early majority start to use it. It will give as some advantages and will like to share them with our contributors.
Please try to understand our idea and check out the code and ensure you can imagine that it is a possible way of React evolution.

If it is true then we will provide some services for a newly generated community which always supported by big companies all over the world.
Companies always try to implement new trends because it helps to attract new developers to complete their awesome projects. 

We will provide this trend. Also, we will provide the documentation website with `jobs` sections. 

This website will allow putting advertisement on the documentation website. And developers/companies will be forced to watch this advertisement in order to read the documentation.

Q: Who will be able to use a place for advertisement and put some jobs in job section? 

A: Only our contributors.

We have very small goal $ 50 000. 
We do not need millions of dollars in order to implement this project. Our mission is to popularize it because we love it. 
Our contributors will invest into things what we love. It means we will work with shiny eyes. We believe it the most valuable requirement for success. 

Let's explain how we create coins 

We will buy the hosting for the next 10 years where a website will be located. 

We skip the first year because believe that people need this time to understand the technology. 

Next 4 years will be divided by days

```
4 years = 1460 days
```

Each day can be used for space for advartizment and job offer.

Our goal is `$ 50 000`

50000 / 1460 = `$ 34.25`

So if you invest `$ 34.25` you buy: 
* Advertisement space at the top for one day. (RELS1)
* Advertisement space aside for one day. (RELS2)
* Prefered Job offer space in first 10 records for 10 days. (RELS3)


So if you invest `$ 1 027.50` you buy:
* Advertisement space at the top for one month. (RELS1)
* Advertisement space aside for one month. (RELS2)
* Prefered Job offer space in first 10 records for 10 month. (RELS3)

In comparison when you want to buy the `advertisement` and `job offer` space on such resources now you will pay:
* `$ 4 000.00` per month for advertisement.
* `$ 3 000.00` per month for advertisement.
* `$ 2 000.00` per 10 month for job offer space.

If you invest `$ 1 027.50` after one year you win `$ 7 927.50` because you trust that we able to do it :)
This is challenge for us but know exact steps how to get this result. 
First of all you invest into the high motivated team and once we get success in it we will continue repeat it again and again. 
And each your next investment will less risky.
And of cource everyone will enjoy new technology.

So ideally we are considering only `1460` people who invest `$ 34.25` for ease. 


Jobs offers will be sorted by `investment` day. If you invested first you will take the first place in job list. 
This tokens have experation time 9 years. If you did not use your token it will fired. Latest bought tokens fire first.


#### Wallets

1. BTC `19Uf4EjwXb2j2FvNvmgY3u7NtM7BYLmrR7` (Check balance: https://bitref.com/19Uf4EjwXb2j2FvNvmgY3u7NtM7BYLmrR7)
2. ETH `0x8d23C40C1703b99D0295b3277E4164cE3DAaF7b6` (Check balance: https://etherscan.io/address/0x8d23C40C1703b99D0295b3277E4164cE3DAaF7b6)
3. LTC `LZFqabuJnk7VavgyTyKe8S9qqGVodbDkRe` (Check balance: http://ltc.blockr.io/address/info/LZFqabuJnk7VavgyTyKe8S9qqGVodbDkRe)

Please generate the `private` key and `address` here https://www.myetherwallet.com/

![Your Address](https://content.screencast.com/users/a.stegno/folders/Jing/media/3fa89573-70cc-4ade-964f-ce1425366dc2/00000461.png)

And put `your address` in payment comment to let us confirm your ownership later. Please keep your private key safe.
We will generate `RELS1`, `RELS2`, `RELS3` tokens and bind them with `your address` 



#### Roadmap

1. Complete contribution campaign.
2. Generate `RELS1`, `RELS2`, `RELS3` tokens, put them in `RELS` blockchain. `20 days`
3. Provide a link to check ownership in bottom of README.md
4. Spend `40 days` for development of the technology.
5. Spend `20 days` for Test.
6. Create the first release available for usage.
7. Create full documentation and site (`20 days`) with `jobs` section.
8. Popularize the solution in Reddit, Hackernews in order to improve coding style of communities (`20 days`).
9. Attend UX/UI Conferances and pitch our technology. (`50 days`)

#### Your goals

1. You will obtain `RELS3` tokens which will be able convert into `job` offers.
2. You will obtain `RELS2` tokens which will be able to convert into the place for advertisement at the top of the website.
3. You will obtain `RELS1` tokens which will be able to convert into the place for advertisement ahead of the website.
4. You will be able to hire top candidates
5. You will be able to watch `USA` job market. We will provide reports.

#### Press

1. https://hackernoon.com/react-livescript-livescript-2-0-164d35ca5373

#### Team

1. `Andrey Stegno` - React - Livescript Developer (https://github.com/askucher)
2. `Alexey Okhrimenko` - Designer / Pug Developer (https://www.behance.net/okhrimenkoalexey)

#### FAQ

1. Why is indented language better?

Because you need to put indents anyway. Almost all teams setup lint on the projects. So better just use code `indention` as part of a language. 
You will save 30% of space because the indented code is compact. 

2. Why did you use `PUG` as HTML syntax 

Because it is close to `CSS` selectors. Just for consistency.

3. Why did you use `React'?

Because it allows building a front-end like a back-end. React is fast and lot's of companies already use it. 
By the way, I was an AngularJS dev before :)

4. Why did you use `LiveScript'?

Actually, I tried to use `Coffeescript` before and it is awesome. But once I tried `Haskell` and `F#` I figured out that `indented` syntax is not enough.
Functional `partial application`, `carry`, `pattern matching`, `pipings` are awesome. And LiveScript has the best `JSON` support :)
You will be able to use this `library` with `Coffeescript` as well. It doesn't matter in this case.

5. Why we try to raise money

* It very hard to reach a satisfied quality without support. Otherwise, we have to combine it with other projects but in this, we still have quality, race risks. 
* It is nice to understand that people in the world care about the world and support people who tries to improve it. 
* This is the first attempt of Github Crypto Crowd Funding (GCCF) with proven success possibility. We are creating a new road.
* It can be a template for similar projects.
* We have the internal force to improve things and try to implement it. It can be the example for other teams.


