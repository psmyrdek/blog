---
draft: false
contentType: post-en
title: "Applying CQRS to Product Design"
description: "Software engineers know most of the benefits that CQRS bring to the table, so maybe we could borrow the same concept to a bit different domain — let’s say — design?"
tags: 
- cqrs
- design
- english
- srp

date: 2019-03-04T18:25:15+01:00

images:
- images/cqrs.png
---

![cqrs](/images/cqrs.png)

Do you know what the CQRS is? Command Query Responsibility Segregation is an architectural pattern used heavily in all kinds of back-end systems, which basically tells you that commands (mutations of the state) should be separated from the queries (parts where you read the data, i.e. for the purpose of UI or reporting).

There are multiple reasons why engineers apply this pattern to their projects, but these two are probably worth mentioning the most:

Firstly, CQRS fits well into this concept of so-called “Single Responsibility Principle” — one of the fundamentals of software engineering. SRP is all about creating things that do just one thing — no mixed concerns, no phone calls while driving, just one thing at a time. By applying CQRS pattern into your system, as a side effect, you are following the SRP rule — you can keep the codebase cleaner, make the maintenance easier, and let reason about a given part of the project without any hassle.

Secondly, CQRS helps you organize your system in a totally different way for the purpose of reads and writes. For example, there may be modules on top of which users run tons of reports every day, so the “read parts” of them have to be as performant as possible. By splitting queries from commands you can be focused on polishing just one thing (reporting queries) at a given point in time, so there’s less risk that other parts will break by mistake.

Software engineers know most of the benefits that CQRS bring to the table, so maybe we could borrow the same concept to a bit different domain — let’s say — design?

## Commands or queries? Reads or writes?

Multiple times in my life I’ve seen (or even built) interfaces that are trying to achieve too many things at once. Imagine the profile page of your favorite social media platform — there’s a non-zero chance that somewhere next to your name there’s this “Edit profile” button that turns labels into forms and inputs you can interact with to update your profile data:

![](/images/cqrs-profile.png)

Sure, in some cases this type of UI/UX lets you complete the task of updating your data relatively fast, but it ruins both read and write experience. Why?
Imagine that there would be some kind of a source of knowledge where readability is a priority. The priority for you would be to make it easy for the consumers to gather most of the knowledge from this mysterious thing in the most efficient way, so you would have to spend lots of time on setting up all the margins and padding properly, picking the right font size, font type and maybe a letter spacing. We could say that “read mode” would be the most important feature of this mysterious thing.

Actually, it’s not that mysterious — it’s called a book. For books and other sources of written knowledge readability is a must have.

![](/images/cqrs-book.png)

Now imagine that you are applying the same UI patterns of the tool that helped you to write a book (like MS Word), to the book itself. Instead of nice spacing between the lines, pretty fonts and useful margins you’d need to introduce completely different experience to find a room for all the buttons, labels, actions, notifications and scrollbars. MS Word is primarily about getting the writers' job done, not about making the readers' life easier (that’s the role of DTP).

![](/images/cqrs-word.png)

For sure this is not the kind of book we would recommend to our friends, right?

## Do one thing well

So this is where CQRS-like pattern comes into action in the context of design. For software engineers, separating reads from writes helps in creating systems that are easier to reason about and easier to tune up. For designers, the approach which is conceptually very similar helps in creating experiences that your users appreciate and 
understand.

The example that came to my mind when I started thinking about it was Wordpress. Wordpress, as a platform, contains hundreds of thousands of layouts that improve the look, feeling and readability of the content you create. The same Wordpress contains just one text editor that has nothing to do with the layout of your blog, yet it helps you create the content that empowers it. Uploading the new layout does not break the editor. Updating the editor does not break the layout. As simple as that.

Do you see why the case I previously mentioned (inline data editing) breaks the read/write separation?

* If we want to find a room for both read-only data, and data editors, we need to sacrifice one of these two — readability, or robustness.
* If we want to let people execute two actions using the same part of UI, we may either complicate the workflow of gathering the data, or limit the one of uploading / writing it to the system
* If someone has to actually implement this kind of UI, it may be hard to distinguish components that present the data from ones that modify it.

Knowing all of this, how could we solve the case of editing the profile data? One of the simpler examples would be to create a dedicated page where all the forms and inputs would serve solely to the purpose of “edit workflow”.

![](/images/cqrs-form.png)

Relatively small margins and padding, call to actions that are easy to understand, dedicated loading indicators, empty states, and so on. No limitations from the perspective of profile page UI, no limitations from the perspective of where this data is being presented, etc. Pure editing experience. Commands, instead of queries.

A huge benefit you could gain from this approach would be in getting rid of all the constraints of presenting the data in read-only mode. No “I need to find a room for edit form”, no “How to hide these inputs next to the labels”, no “The font is too big for editing the data”. Feel free to introduce a bit bigger letter spacing, bigger font size, and fancy margins. No edit forms attached. Think about queries, instead of writes.
—
So that’s how I see it. As an engineer, from time to time I was trying to learn more about the CQRS pattern and all those positives it brings when applied.

Recently I found the connection between the same idea and the world of product design and today I’m trying to share this with you. Of course, it’s not “one fits all” solution, and there will be cases where inline edit forms work better than the solution presented here, but I hope that my post may help you reconsider or balance some of the design decisions you make during your regular workday.

I’m really eager to see your point of view on this. Do you find such a perspective useful? Do you think that inline editing provides a better experience for the user? Let me know in the comments!