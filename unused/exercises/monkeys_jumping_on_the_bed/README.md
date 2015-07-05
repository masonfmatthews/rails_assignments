# Monkeys Jumping on the Bed

## Description

Create a method to reduce duplication in your code.

## Instructions

You are a very tired parent.  Your kids love hearing the same thing again and again, so you are forced to sing a song called "Five Little Monkeys" until you pull your hair out.  The song goes like this:

5 little monkeys jumping on the bed
1 fell off and bumped his head
Mama called the doctor,
And the doctor said
No more monkeys jumping on the bed

4 little monkeys jumping on the bed
1 fell off and bumped his head
Mama called the doctor
And the doctor said,
No more monkeys jumping on the bed

3 little monkeys jumping on the bed
1 fell off and bumped his head
Mama called the doctor
And the doctor said,
No more monkeys jumping on the bed

2 little monkeys jumping on the bed
1 fell off and bumped his head
Mama called the doctor
And the doctor said,
No more monkeys jumping on the bed

1 little monkey jumping on the bed
1 fell off and bumped his head
Mama called the doctor
And the doctor said,
No more monkeys jumping on the bed

See?  You're already bored.  In any case, computers are supposed to reduce duplication in our lives, right?  So the first thing that you do is write code with five puts statements in it, one for each verse.  There's a ton of duplication in it, but at least the computer can sing instead of you.

However, you can do better.  Your first goal is to write a method called `verse` that you can call five times and just pass it the verse number.  Then your code will be much simpler, and it will be easier to change later.

After you finish your first goal, on to your second.  Notice that "1 fell off" is sort of silly in the last verse right after saying there was only one monkey on the bed.  When singing the last verse, say "It fell off" instead.

Your third goal is to make this song about more things than monkeys.  What if "elephants" were jumping on the bed?  Add a second parameter to the verse function which takes the animal name.

Finally, let's say you sometimes want to be snappier with your song.  Sometimes you want to sing it like described above "Mamma called the doctor//And the doctor said", but sometimes you want to leave off the and: "Mamma called the doctor//The doctor said".  Add a third parameter to the method which allows you to keep or lose the and, depending on what you pass to that third parameter.
