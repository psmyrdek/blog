---
draft: false

title: "Web Components - The Next Big Thing of Modern Web?"
description: "Lessons learned, strengths, weaknesses, and what is yet to come."
tags: 
- front-end
- web components
- engineering
- stencil

date: 2019-04-12T17:29:16+02:00

images:
- images/pipes.png
---

![pipes](/images/pipes.png)

Recently I've been involved in multiple discussions around Web Components and I noticed that there are questions that still introduce a lot of confusion among front-end developers. By creating this post I'm trying to summarize my point of view on this very important topic of the modern web.

## Q: Do I really need them?

Let’s be honest - if you’re interested in Web Components only because of the article you’ve just read, or the talk you’ve just watched the answer is probably - no, not immediately. There’s no need to abandon frameworks you’re familiar with only to introduce yet another API into the thing you’re building. If the codebase you work with is rather consistent, or if there’s no need to extract framework-agnostic components and maybe the projects you create have a relatively short expiration date I would suggest sticking to solutions you’re most experienced with. On the other hand, if you work inside of divergent environment where different apps are based on different frameworks, where you can find some bits of legacy code here and there, and when there’s a real need for refactoring towards component-based architecture - yes, in such cases I would consider Web Components. At SmartRecruiters we decided to follow this path to unify multiple implementations of exactly the same feature, which resulted in an encapsulated component that can be used within both Angular and non-Angular apps at the same time (we’re Angular-heavy company). It helped us reduce the technical debt and overall complexity of components related to the domain we work with, without forcing to support Angular runtime everywhere. And we’re still on the very beginning of our Web Components adventure - more lessons are yet to come.

## Q: I see the benefit of going Web Components, but why their API is so raw making it hard to sell to my team?

The reason why Web Components’ API looks as raw as you may be thinking about it is that they play a really low-level role in your tech stack. If there would be an opinionated way of handling data-binding, templating, state management or anything like that inside of Web Components spec it would close the doors for any 3rd party solutions that can be built on top of it. Confusion may also happen when you compare them to frameworks you work with every day, but in my opinion, the frame you should use when thinking about Web Components should be more like “a replacement for div and span” instead of “a replacement for React or Angular”. To help you understand this perspective I suggest you the following exercise - take some time to build this kind of raw “Web Component” and over time introduce improvements for different parts of it. For rendering mechanism, start from binding strings to innerHTML property, then move to template tag, then introduce dynamic templates using lit-html. For data binding, start from watching attributes and properties, then re-render everything manually in property setters and then extract this common logic of observable property to a decorator. By doing all of this you may notice how many ways of implementing the same thing (but better) you have, making you feel that you’re working with the internals of a framework, instead of a framework itself. When it comes to APIs that are easier to sell to your team I’d suggest checking solutions like stencil or lit-element.

## Q: What’s the difference between raw Web Components and tools like Stencil or lit-element?

The most important difference between raw Web Components and all kinds of “Web Component factories” is about fancy named “Developer Experience” - the total sum of feelings you face when working with, and distributing Web Components ;) For example, in Stencil, you’re able to write your components using TypeScript. You are ready to distribute components in a form of npm packages via so-called “collections”. You are ready to put your components in front of IE11, because of polyfills management Stencil gives you. You can lazy-load your components and split the final bundle into chunks, and you can use JSX to build templates of your components. Additionally, you can save some time by using Stencil’s decorators like @Component, @Prop or @State to get rid of duplicated logic not exactly related to the business case you’re trying to solve (by logic I mean things like registering your custom elements in the registry, reacting to changes of properties and attributes and re-rendering everything when the state is being updated). Yet, the most important part about Stencil (or Stencil-like solutions) is to be able to produce native custom elements that can interoperate with most frameworks you can think of.

## Q: I know that tools like Stencil or lit-element improve the DX of Web Components, but isn’t it the same as using yet another framework? Is there any difference between these two approaches?

Let's think about the case where the vendor (Stencil, React, Angular, etc.) behind the component you built some time ago is starting to look like a legacy one. People moved to a different tool or the support for it has been suspended. Consider two possible scenarios. First - when there's a component that only works within a specific runtime (and most frameworks have their own very specific runtimes) that's basically it when it comes to interoperability. There's this very little chance that “the next big thing” will be willing to talk to a component built using Angular, React or Vue. They will probably introduce their own runtimes which might be incompatible with your component so passing the data into them becomes impossible. Now think about the scenario when instead of producing framework-specific components, your codebase is full of custom elements which meet these two requirements - you can bind data to their properties just as you’d do it with regular DOM elements and they *react* to changes of bound data, and you can also subscribe to events they emit via native “addEventListener” method. The first scenario is when you go frameworks which are very often incompatible with each other. The second scenario is when you go Web Components, which ensures that components you produce have a much longer expiration date. Answering the original question - yes, in terms of API it’s really up to your preferences, however, in terms of the outcome of your work, the difference is really meaningful.

## Q: I decided to go framework-less for some parts of my project, but how can I handle application-wide state management inside of my custom elements?

When you look really closely, it turns out that inside of libraries like redux or mobX there is nothing about either React or Angular. You should think about them as regular JavaScript modules which can be combined with various components your app contains (yes, also Web Components), instead of tools that are tailored for any specific framework. As long as your component is able to subscribe to changes inside of a given store or state container, everything should work fine. To understand it better, you can create your own store or any pub/sub container as a vanilla JS module, expose it globally and call its methods from the inside of custom element you are building. Then you’re just one step from replacing it with your favorite state-management library and nothing really changes. In a broader context, this is still valid answer for other questions like “How can I … with Web Components” - as long as the relationship between different parts of your client-side codebase is set up properly and there’s no requirement for any specific runtime provided by a framework, things will just work.

---

To see the slides from my recent talk about Web Components [click here](https://docs.google.com/presentation/d/e/2PACX-1vTzGwaHXRwJTjY4-OiZ66RxxRgC2DOcP_Rd3f2NdfgXLzD3TtugNWOYPG9BhYOia5-xHfKAR5nZHm2p/pub?start=false&loop=false&delayms=15000) - your feedback is more than welcomed!

Check out the tools I mentioned above:

Stencil - [https://stenciljs.com/](https://stenciljs.com/)

lit-element - [https://lit-element.polymer-project.org/](https://lit-element.polymer-project.org/)