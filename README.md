# COMP90054 AI Planning for Autonomy - Project 2 - PDDL modelling 

You must read fully and carefully the assignment specification and instructions detailed in this file. You are NOT to modify this file in any way.

* **Course:** [COMP90054 AI Planning for Autonomy](https://handbook.unimelb.edu.au/subjects/comp90054) @ Semester 1, 2023
* **Instructor:** Dr. Nir Lipovetzky and Prof. Tim Miller
* **Deadline:** Tuesday 25 April, 2023 @ 11:59pm (Start of week 8)
* **Course Weight:** 10%
* **Assignment type:**: Individual or pairs
* **ILOs covered:** 1, 2, and 3
* **Submission method:** via git tagging and Canvas submission (see Submission Instructions below for instructions)
* **Extensions:** For extension applications, email Tim: <tmiller@unimelb.edu.au>. Tim will ask you to consider whether an extension is really a good idea, or whether it will just impact other assessments. If the former, try to do what you can and let us know in the self evaluation.

The **aim of this project** is to improve your understanding of PDDL modelling and to improve your abstraction skills,

 <p align="center">
    <img src="img/boba_robot.jpg" alt="Boba robot"  width="450" height="300">
 </p>

## (Un)grading

Assignment 2 will use ungrading the same way that assignment 1 did. We have given some additional detail to clarify the self evaluation and to help people learn how to "deal with" ungrading.

Based on assignment 1 feedback, a majority of people preferred self-grading, with about 25% prefering traditional grading. The main reasons people disliked ungrading were:

1. Quite a few people  saying that they found it great but they wanted to just be able to tick boxes to get marks so they could "know" what their mark would be. We agree this is good if your only aim is to get marks rather than to learn, which is precisely why we are using ungrading: to encourage learning. Further, this is much closer to reality -- there are very few tech jobs where peopel get structured rubrics to assess their contribution.
2. There were a number of comments that ungrading felt subjective, compared to rubric-based marking. We can assure you that, as a group of people who have graded thousands of assessments, rubric-based marking is very far from objective. I encourage you to read 'Noise, A Flaw in Human Judgement' by Sunstein, Kahneman, and Sibony. Further, rubric-based grading is not a good measure of how much people have learnt.
3. It seems many people felt that they have to write a lot for the self evaluation. A self assessment can be short AND good. There is no need to write pages of text -- just justify why you did a good job and learnt stuff. In Assignment 2, we give a bit more direction and set expecations to avoid people spending too much time on the self evaluation
4. A number of people felt that the self evaluation was unnecessary when there are test cases. However, several people who said this also commented that it did make them reflect on their own learning, so this is good! In addition, many people who liked ungrading commented that it reduced the stress of trying to get every test case right.

There were many reasons people liked ungrading, chiefly:

1. Independence and autonomy: people felt more responsible for their own learning and appreciated the additional autonomy and independence that ungrading provided.
2. Reduced the stress of trying to get everything right and figure out what the staff wanted to see.
3. Allowed people to explore and take a few more risks, because if they failed, learning still occurred.

More generally, we saw several people either not submitting a self evaluation or not really taking the time to reflect on their learning. In this assignment, we make the expectations clearer: students are marked based on their self evaluation.

### Collaboration

Assignment 2 can be completed individually or in pairs. We encourage pairs to work together to learn from each other; not to simply split the tasks for efficiency. But we will not monitor this -- it is your responsibility. You can submit different solutions or the same solution, we just want to encourage collaboration.

For the student works in pairs, you must submit an individual short self evaluation. 

We encourage students to derive their own tests for the tasks and share them with others to help with learning.

## The Domain - Bubble Tea robot

Your task is to model a robot that makes bubble tea. The owner of the company has just a few hard-coded recipes, but would prefer that customers are able to flexibly specify their own bubble teas.

The robot is able to do three things: (1) add ingredients to a cup; (2) mix the ingredients that are in the cup; and (3) heat the ingredients that are in the cup.

There are four main types of ingredients: (1) tapioca balls; (2) syrup; (3) ice; and (4) the tea itself. The model can add any of these to the cup at any point. Syrup and tapioca balls can be flavoured.

Customers can specify whether they would like their drink mixed or not (modelling as a PDDL predicate in a goal). If the tea and syrup are mixed, the drink is considered to be "mixed". However, if the tapioca balls are mixed, the mixer blends them into a syrup, so there are no longer tapioca balls in the drink.

When ice is added to the cup, the drink is considered to be iced. Otherwise, it is not iced (modelled as a PDDL goal).

The cup can be heated in a microwave. Typically, customers like heated tapioca balls (modelled as a PDDL goal), otherwise the tapioca balls are too hard. If the ice is heated, it melts so the drink is no longer iced. Customers can also specify that they would like the tea or the syrup iced as well (modelled as a PDDL goal).

The robot can make just one bubble tea at a time.


## Tasks

You can use the classical propositional STRIPS subset of PDDL + typing, negative preconditions and conditional effects. You are responsible for creating the domain and problems files, specifying any types, predicates, and actions (including action parameters, preconditions and effects), initial states, and goal states.

### Task 1 [0 marks]

As a first task, model PDDL actions (can be one action or multiple) for adding the ingredients into a drink. Only one of each ingredient can be added into a single drink.

For this, you will also need to model the PDDL predicates, constants, etc.

Once you have actions modelled, specify problems to test the following:

<ol type="a">
  <li>A customer can create an iced drink with the tea, mango tapioca balls, and mango syrup.</li>
  <li>A customer cannot create an iced drink with the tea, ice, and two different flavours of syrup.</li>
</ol>

### Task 2 [0 marks]

The second task is to model heating the cup in the microwave, and mixing the ingredients of the cup.

Once you have actions modelled, specify problems to test the following:

<ol type="a">
  <li>A customer can create a mixed drink with the unheated tea, heated mango tapioca balls, unheated mango syrup, and no ice. </li>
  <li>A customer can create a mixed drink with no tapioca balls, unheated mango syrup, unheated lime syrup, and ice. (Think carefully about this. If you have modelled the mixing properly, this should be possible).</li>
</ol>

You may need to change your actions from Task 1 for this. That's fine -- you should only submit the final versions.

### Task 3 -- Challenge task [0 marks]

This task is a more challenging task that will take more time than the first two tasks, but you may wish to complete it if you want to learn more about PDDL.

The owners developing the robot have noticed that if the cup is heated in the microwave, the cup becomes too hot to handle. Fortunately, they have just upgraded the robot so that it can use two cups at a time.

Create a new version of your model that has two cups.

It is strongly recommended that you model this in a new domain file.

You should have the same actions as before, but this time, the actions apply to one of the cups. When heated in the microwave, the cup should be noted as being hot. In addition, the robot can tip all ingredients from one cup into the other, between either cup. This will tip all ingredients.

Once you have actions modelled, specify problems to test the following:

<ol type="a">
  <li>A customer can create a mixed drink with the unheated tea, heated mango tapioca balls, unheated mango syrup, no ice, and an unheated cup. This is the same as Task 2.a, but with an unheated cup.</li>
  <li> A customer can create a mixed drink with no tapioca balls, unheated mango syrup, heated lime syrup, ice, and an unheated cup. This is the same as Task 2.b, but with an unheated cup and with heated lime syrup.</li>
</ol>

### Task 4 -- Self evaluation [10 marks]

For each question, write a brief self evaluation that includes how many marks you believe that you have earnt in ths assignment. Your self evaluation for each question must include:

* Self evaluated marks for each question, with a breakdown of:

    * 3 marks for Task 1
    * 5 marks for Task 2
    * 2 marks for Task 3

* A brief overview of why you have earnt this. As part of your overview, consider the following:
    
    * whether you can successfully generate correct plans for the goals;
    * explain how you checked the correctness of your plans;
    * whether you believe that your model is robust -- that is, whether it can generate correct plans for goals other than those specified above and why you believe it is robust;
    * whether your model is clear, concise, and at the 'right' level of abstraction -- that is, the model contains only those aspects that are needed to solve the problem;
    * what you learnt about modelling and abstraction; and
    * list any assumptions that you have made.
       
For each task (1-3), keep this to 2-3 paragraphs.

Note that completing the tasks without submitting a self evaluation will not attract ANY marks. You must tell us the evidence that you use to self-evaluate yourself.

## Ambiguous details?

You may have questions about the above description, such as: "what should happen if this happens, but then that -- what should the behaviour be?".

The answer: just choose a sensible behaviour and model it. We don't care if the model does exactly what our model does -- we care that you are learning about modelling and abstraction. You should be able to make a sensible assumption about the behaviour and model it. You will still learn the same amount!

## Debugging tips and other resources

If the planner is failing to return a plan, but you think it should, debugging is more difficult than in imperative programming languages, because the model is declarative and there are no standard PDDL debuggers.

There are two techniques to help debug the model:

1. **Simplify the goal**: If your goal contains multiple predicates, try removing them systematically to see which goal (or combinations of goals) are preventing the solution. This helps to identify which actions you may have modelled incorrectly.

2. **Use preconditions as goals**: If tip 1 does not work, write out the plan that you expect it to find. Then, create a new problem instance, take the first action of your expected plan, and set its precondition as the goal. If it fails, you have identified where your model is not doing what you expect. If it does not fail, move to next action in the plan, setting its precondition as the goal, and iterate.

Don't forget there are a host of other resources to help with model building and debugging: https://canvas.lms.unimelb.edu.au/courses/151398/pages/links-to-ai-tools?module_item_id=4570190

## Submission Instructions

Your submission has three parts: a session saved on planning.domains; a PDF file submission on Canvas; and a submission certification form.

### planning.domains submission

Copy the domain and problem files into a session at https://tinyurl.com/comp90054. 

From the menu, select **Session** --> **Save** --> **Read only (link)** to get the session URL. See a video below showing how to do this.

### PDF report submission

Your submission should contain a report that includes:

1. Your unimelb student ID and student email address, and the name of anyone partner that you completed the assignment with.

2. A link to the URL of your planning.domain session at https://tinyurl.com/comp90054

3. The PDDL domain file(s), cut and paste into the PDF report.

4. The PDDL problem files, cut and paste into the PDF report.

5. The output generated by the problem files. That is, the plan if it generates a plan, or the output specifying that no plan was found.

6. Your self evaluation for each question.

7. An optional appendix, if you want to add additional details, such as additional problem files or solutions that you tried that didn't work out.

How you choose to lay out the report is entirely up to you. We recommend a sub-section for each question, with each sub-section containing the action model, problem instances, and the self evaluation. However, if you think another layout is better for your report, feel free to do that.

### Submission certification form

Make sure you fill in the [submission certification form](https://forms.gle/dzrVEKbgrb3bUPRL9)

> **Warning**
>Non-certified submissions will attract **zero** marks.

## How to get started

Once you clone the repository onto your local machine, watch the following awesome videos from Nir on how to get started. **Note**: The videos were recorded in 2020, and so the example PDDL is not for this assignment.


Visual Studio and VSCode are good tools for this assignment, as they have excellent PDDL integration. 

Alternatively, go to https://tinyurl.com/comp90054  in your web browser. This points to a session that includes a "planning-as-service" icon. You can choose among several planners, some optimal, some not, and one that gives several diverse plans (for small instances). The default timeout is 5 seconds and 1GB of RAM.

If the planning-as-service is not working at any point (it is currently in beta mode), use the standard "solve" icon, as this is the defacto planner hosted elsewhere.

### Upload to Editor.planning.domains, how to save a session and work online

[![Editor.planning.domains](img/loom1.png)](https://www.loom.com/share/e090b59c6ec64f72a56eedb832f35665)

### Download session offline with vscode and call the online planner

[![Editor.planning.domains](img/loom2.png)](https://www.loom.com/share/0929592cfa234cecbc759ffcbb4c76d8)

### Work with VScode directly and the online planner

[![Editor.planning.domains](img/loom3.png)](https://www.loom.com/share/93a97890983c407a852c5e0048a710e2)

### PDDL Tutorials


Live modeling session in PDDL:

[![](img/loom_pddl_tut.png)](https://www.loom.com/share/203014b2444d4554b4466c4c9093501e "")


VScode PDDL Tutorial: 

[![](http://img.youtube.com/vi/XW0z8Oik6G8/0.jpg)](http://www.youtube.com/watch?v=XW0z8Oik6G8 "")



## Important information

**Corrections:** From time to time, students or staff find errors (e.g., typos, unclear instructions, etc.) in the assignment specification. In that case, corrected version of this file will be produced, announced, and distributed for you to commit and push into your repository.  Because of that, you are NOT to modify this file in any way to avoid conflicts.

**Late submissions & extensions:** A penalty of 10% of the maximum mark per day will apply to late assignments up to a maximum of five days, and 100% penalty thereafter. Extensions will only be permitted in _exceptional_ circumstances; refer to [this question](https://docs.google.com/document/d/17YdTmDC54WHq0uZ-2UX3U8ESwULyBDJSD4SjKCrPXlA/edit?usp=sharing) in the course FAQs. 

**About this repo:** You must ALWAYS keep your fork **private** and **never share it** with anybody in or outside the course, except with a person if you are working as a pair, _even after the course is completed_. 

**Academic Dishonesty:** This is an advanced course, so we expect full professionalism and ethical conduct.  Plagiarism is a serious issue. Please **don't let us down and risk our trust**. The staff take academic misconduct very seriously. Sophisticated _plagiarism detection_ software (e.g., [Codequiry](https://codequiry.com/), [Turinitin](https://www.turnitin.com/), etc.) will be used to check your code against other submissions in the class as well as resources available on the web for logical redundancy.  We trust you all to submit your own work only; please don't let us down. If you do, we will pursue the strongest consequences available to us according to the **University Academic Integrity policy**. For more information on this see file [Academic Integrity](ACADEMIC_INTEGRITY.md).

**We are here to help!:** But we don't know you need help unless you tell us. We expect reasonable effort from you side, but if you get stuck or have doubts, please seek help. We will ran labs to support these projects, so use them! While you have to be careful to not post spoilers in the forum, you can always ask general questions about the techniques that are required to solve the projects. If in doubt whether a questions is appropriate, post a Private post to the instructors.

**Silence Policy:** A silence policy will take effect **48 hours** before this assignment is due. This means that no question about this assignment will be answered, whether it is asked on the newsgroup, by email, or in person. Use the last 48 hours to wrap up and finish your project quietly as well as possible if you have not done so already. Remember it is not mandatory to do all perfect, try to cover as much as possible, and focus on your own learning. By having some silence we reduce anxiety, last minute mistakes, and unreasonable expectations on others. 

Please remember to follow all the submission steps as per project specification.

## COMP90054 Code of Honour

We expect every UoM student taking this course to adhere to it **Code of Honour** under which every learner-student should:

* Submit their own original work or that produced with their partner if working in pairs.
* Do not share answers with others.
* Report suspected violations.
* Engage in any other activities that will dishonestly improve their results or dishonestly improve or damage the results of others.

Unethical behaviour is extremely serious and consequences are painful for everyone. We expect enrolled students/learners to take full **ownership** of your work and **respect** the work of teachers and other students.


**I hope you enjoy the project and learn from it**, and if you still **have doubts about the project and/or this specification** do not hesitate asking in the [ED Course Discussion Forum](https://edstem.org/au/dashboard) and we will try to address it as quickly as we can!
