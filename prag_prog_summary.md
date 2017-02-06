# Chap 1 - A Pragmatic Philosophy

1. The cat ate my source code
    * Take responsibility for an outcome.
    * Admit errors and mistakes.
    * Offer options or solutions, not excuses.

2. One broken window
    Don't leave bad designs, wrong decisions, poor code unfixed.
    It leads to software entropy.

3. Stone soup and boiled frogs
    Be a catalyst for change. Show them a glimpse and get them to rally around.
    Remember the big picture.

4. Good enough software
    * Let users decide if what's produced is good enough.
    * Involve users in the trade-off.
    * Great software today is preferable to perfect software tomorrow.
    * Give users something to play with early and their feedback may lead to better eventual solution.
    * Know when to stop. Step back with critical eye to view what's been done.

5. Your knowledge portfolio
    Learn new things regularly.
    Diversify your knowledge.
    Manage risk. Learn high risk high reward and conservative stuff.

    > "Don't put all your technical eggs in one basket."

    Learn emerging technologies before it becomes popular.
    Review and rebalance. What was hot might be cold now.

    **Goals:**
      * Learn one new language a year.
      * Read one technical book each quarter.
      * Read non technical books too.
      * Take classes.
      * Participate in local user groups.
      * Experiment with different environments.
      * Stay current.
      * Get wired. Ins and outs of new language or technology.
      
    Always be finding opportunities for learning.
    Critically analyze what you read and hear.

6. Communicate
    * Know what you want to say
    * Know your audience
    * Choose your moment
    * Choose a style
    * Make it look good
    * Involve your audience
    * Be a listener
    * Get back to people

____

# Chap 2 - A Pragmatic Approach

1. The evils of duplication
    Duplication causes maintenance nightmares.

    > "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system"

    Tip: Make it easy to reuse. If you fail to reuse, you risk duplicating knowledge.

2. Orthogonality
    Eliminate effects between unrelated things. Design self-contained components that are independent and with a single well-defined purpose.
    Design - Layering and Abstraction. If requirement for one item is changed, it should not affect other non-related systems.

    **Coding:**
      - Keep your code decoupled. Write shy code.
      - Avoid global data.
      - Avoid similar functions.

    Testing - Unit tests and Bug fixes tests the orthogonality of the system as a whole. What does it take to build and link a unit test? How localized is the fix?

3. Reversibility
    Requirements may change. Be prepared for contingencies. There are no final decisions.

4. Tracer code
    End-to-end connection among components of system to check how close to the target, adjusting if necessary.
    Tracer vs Prototyping. Tracer is lean but complete skeleton of final system. Prototype is disposable recon intel gathering code.

5. Prototypes and Post-it Notes
    Prototype to learn. Can ignore details. Set expectations that prototype is not complete.

6. Domain languages
    Program close to the problem domain?

7. Estimating
    * Understand What's Being Asked.
    * Build a Model of the System.
    * Break the Model into Components.
    * Give Each Parameter a Value.
    * Calculate the Answers.
    * Keep Track of Your Estimating Prowess.
