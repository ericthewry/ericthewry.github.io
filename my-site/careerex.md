# Career Explorations
## Programming Lab 2

> _This document can be found at ericthewry.github.io/careerex.html_

Aaaaaand we’re back! 

Today your task is to explore more of the experimental side of
computer science. We’ll be investigating different ways to cause
routers to fail.

### Task 0: Login, Download and Install

Your username is CIT-ph318. Your password is Password1. (Sorry Meryl!)

To kick things off, you will need to install _Processing_ and download
the starter code.

Please open Firefox.  Chrome will not work. Visit this page:
[ericthewry.github.io/careerex.html](ericthewry.github.io/careerex.html). Click
[here](https://drive.google.com/file/d/16-D4WL9LUFjBQdMg0lXoo1QbIujYQ6jG/view?usp=sharing)
to download both the starter code and the lab. Press as many download
buttons as you need to start the download. Once the download has
completed, right click on the downloaded file and click "Extract All."
When the dialog appears, click on "Browse" and select the Desktop.

To download the _Processing_ tool, click
[here](http://download.processing.org/processing-3.5.3-windows64.zip). Once
the download has completed, right click on the downloaded file and
click “Extract All.” When the resulting progress bar finishes, open
_Processing_. From the _Processing_ tool, open the `Lab_2.pde` file
that resides inside the directory called `Main`.

Select the `Lab_2` tab before moving on.

### Task 1: Experiment

_You will not write any code to complete this task._

Once you’ve gotten _Processing_ up and running. Start the program by
pressing the play button in the upper left corner of the window.  You
should immediately notice some similarities and differences from
yesterday.  Routers are indicated by a gray icon. Each has a vertical
grey box to the side -- its queue. The queue is the “lunch line” of
packets waiting to be processed. At each step, each router will
process one packet from the front of its queue.  When a packet arrives
at the router it will go to the back of the queue to be processed.

> _Exercise 1a._ Send some packets around the network to get a sense for how queues work.

Routers can also fail! In our simulation, this is indicated by a
router turning yellow. Failed Routers cannot process additional
packets -- it’s like someone turned them off.

So when do Routers fail? When their queues fill up, and a new packet
arrives to the Router. If there is no space in the queue, the router
will fail.

> _Exercise 1b._ Cause any router to fail by filling up its queue.

> _Exercise 1c._ Cause Router 3 to fail

> _Exercise 1d._ Cause Router 3 to fail without sending a packet directly to it

> _Exercise 1e._ Bring down ONLY Router 3 without sending a packet directly to it

Once you’ve completed the exercises above, spend a few minutes to try
the following exercise. If you can’t figure it out, feel free to move
on to Task 2.

> _Exercise 1f._ (extra credit) Bring down ONLY Router 3 without sending a packet directly to it while making sure that Router 1 can still send packets to Router 0. Call over an instructor and have a discussion about why this is hard!

### Task 2: Denial of Service

In this task you will program an `EvilRouter` that will target a single
router in the network and make it fail by sending too many packets for
it to handle. This is called a denial of service attack or DoS attack
for short.

In the simulation pane, you can turn a normal `Router` into an
`EvilRouter` by double clicking it.. To target another `Router`, click
first on the `EvilRouter` and then the `Router` you wish to attack.

The `EvilRouter` contains five commands that you can interface
with. For now, you will only define the `EvilDoEveryStep` command, which
is executed by `EvilRouters` whenever the simulation moves forward a
single step.

```
   void evilDoEveryStep(Router target) {

   }
```

The `target` is the `Router` that the current `EvilRouter` should attack.

> _Exercise 2a._ Write code between the curly braces of the
> `EvilDoEveryStep` command to tell an `EvilRouter` how to attack a
> `Router`.

> _Hint._ `Router`s process one `Packet` per step from the queue. How many
> should arrive per step for the queue to eventually fill up? 

Once you’ve completed _Exercise 2a_, you have a chance to do some real
Computer Science. Try and think about other ways to design a
solution. How many packets should you send at each step? 5? 10? 100?
Can you think of other ways to bring down a router? What might be the
advantages of one approach over another?


### Task 3: Muck About

Your final task is to simply muck about with the code that we have
given you. Come up with some questions you have about some of the
networking concepts we’ve talked about and use the Cheat Sheet with
all of the commands that you can use to try and execute them.

The `EvilRouter` has 4 commands that you can write code in
with. You’ve already seen how `evilDoEveryStep` works. There are also
`evil` versions of the `itsForMe`, `dontKnow` and `doKnow` commands
from the lab yesterday, called `evilItsForMe`, `evilDontKnow`, and
`evilDoKnow` respectively. You can make changes to these commands
while figuring out the answers to your questions.

If you’d like to see our solution to yesterday’s lab, simply scroll to
the bottom of the `Lab_2` file where it describes the `UnsafeRouter`
(Tomorrow you will implement a `SafeRouter` that does not fail from a
__DoS__ attack). You may change this solution if you desire!

For now, try to be creative and do whatever you find interesting! You
might, for example, implement one of the strategies of the Malicious
Agents from our earlier activity, like refusing to forward packets. If
you’re stuck on what to do, you might draw inspiration from some
options we have provided below:

_Option 1. Spoofing for fun and profit_

You might try to implement spoofing, which is just a fancy term for
“lying about who sent a packet”. To do this you will need to write

```
  p.src = <insert your code here>;
```

before you forward the packet on. This changes the Sender (i.e. the
`src`) of the packet. You will need to change some commands besides
evilDoEveryStep for this to work.

_Option 2. Pretend to be a failed router_

As you learned in task 1, failed routers do not forward packets
through the network. They are black holes that receive everything and
send nothing. This makes it difficult for other routers to send
packets across the network!

_Option 3. Send only one packet on `evilDoEveryStep`_

Try to execute an attack on a router where you only send a single
packet in evilDoEveryStep. One way to do this is to perform a
Distributed Denial of Service attack or DDoS, which is where you send
packets from multiple routers. You can do this in the interface (by
creating multiple EvilRouters), or, even better, write code to “trick”
other, normal routers into sending many packets to your target.
