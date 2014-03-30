Crowdfunding
============

I want to replace the economy with a transparent computer moderated version starting with a restaurant. This software is to gather cost estimates and allow crowdfunding of the software to manage [sales](https://github.com/OneAcreCafe/sales), [costs](https://github.com/OneAcreCafe/costs), and [scheduling](https://github.com/OneAcreCafe/labor). I also want to rent [housing](https://github.com/dhappy/housing). The goal is a user signs up for a [tour](https://github.com/dhappy/tour) and the software helps them work out a trip schedule with accommodations and labor to pay for it.

To get all this done I need help. I'm particularly interested in the [bounty source](//bountysource.com) model. People post rewards for closing issues. I have three major issues with bountysource.com:

* Though they are [soon to support bitcoins](https://github.com/bountysource/frontend/issues/390), they will convert them to dollars.
* You can place bids on issues, but those bids aren't visible in the project view. I want totals for what it will cost to reach various milestones.
* [It doesn't work.](https://github.com/bountysource/frontend/issues/470)

So, this is an attempt to create an alternative. It will be a rails app.

-----

One possible issue with this model is duplication of effort. Alice and Bob both hope to win a bounty so they set to work. Alice finishes first and collects. Bob's work is likely discarded.

I'm uncertain what to do about this other than publishing which users are simultaneously working on an issue.

I also don't want to rush people. I'd like to be able to assign a developer to an issue with an expiration, and they have first shot at the bounty within that timeframe.
