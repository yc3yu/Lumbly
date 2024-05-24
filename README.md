<table>
  <tr>
    <td>
      <img src="https://github.com/yc3yu/Lumbly/blob/main/Lumbly/Resources/Assets.xcassets/AppIcon.appiconset/App_icon_1024.png?raw=true" width=250px/>
    </td><td>
      <h1>Lumbly</h1>
      An app that helps physiotherapy patients perform their prescribed exercises correctly at home.
      <br><br>
      This is a prototype iOS application, developed for a fourth year design project (capstone project).
      <br><br>
      <b><i>Please see below for a walk-through of the app with screenshots and descriptions.</i></b>
    </td>
  </tr>
</table>

## Description

The primary users of this app are physiotherapy patients who are prescribed exercises by their physiotherapist to perform regularly at home. As such, this app is meant to be part of a larger system that would include a physiotherapist-side desktop app, where physiotherapists can create exercise sets for each patient, choosing from a large database of exercises that a machine learning model and exercise analysis pipeline would be trained on.

Users of this app can view their prescribed exercise sets, track their adherence, view instructions for each exercise, and submit videos of themselves performing their prescribed exercises to automatically check their form and receive tips based on their exercise history.

For the purpose of demonstrating this app's core functionality, the _Bird Dog_ exercise was implemented as an example of how this app can guide a user through the correct completion of a prescribed exercise.

## Notice

The server used by this app is no longer running or being maintained. As a result, some content does not load, and the exercise analysis function is no longer available. Please see below for example screenshots of properly loaded content.

## Workflow

### Onboarding

Upon launching the app, the first screen that the user sees allows them to choose between _Sign up_ and _Log in_.

The button on each subsequent screen is disabled until all required text fields are filled in. If the user taps the button while disabled, an alert appears to inform them of this requirement.

Once all required fields are completed, the button turns blue and becomes enabled, directing them to the _Home_ screen.

| Onboarding | Sign up |
|------------|---------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/a047b480-93a1-44b3-9427-751c179d5b3e" width=300px alt="Onboarding"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/e52a26d5-5bd2-4480-ab32-dfd696c0cb80" width=300px alt="Sign up"> |

| Log in (button disabled) | Log in (fill in all fields alert) | Log in (button enabled) |
|--------------------------|-----------------------------------|-------------------------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/8d3cbd96-0214-418c-ac54-85813350a2d3" width=300px alt="Log in (button disabled)"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/8b41ec83-f4d7-45b1-a423-134cfe24200b" width=300px alt="Log in fill in all fields"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/53c33779-33bc-4640-be2a-20f7c3d5c6cc" width=300px alt="Log in (button enabled)"> |

### Viewing an exercise set

From the _Home_ screen, users can access their _Profile_ (this view was not implemented for this demo), select an exercise set that their physiotherapist creates for them, and view their adherence to their prescribed exercises for the current week.

**For demo purposes, select _Lower Back Exercises_ to continue.**

The next screen summarizes the exercises in the chosen exercise set, where each tile can be tapped to reveal detailed instructions for the chosen exercise.

**For demo purposes, only the _Bird Dog_ tile shows detailed instructions, while the other tiles lead to dummy screens.**

To begin the set, the user taps _Start Exercise Set_.

| Home | Example exercise set |
|------|----------------------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/bb76df3e-011e-465d-88d5-edbcf3e931ec" width=300px alt="Home"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/3d61b92c-474a-4ddb-b296-27e37f07ef53" width=300px alt="Lower back exercises set"> |

### Starting an exercise set

Once the user taps _Start Exercise Set_, they are directed to the instructions for the first exercise in the set, where they can press _Ready_ to begin the recording process for the first exercise. As seen in the images below, the details shown for each exercise include _Steps_ for the exercise and _Tips_ based on their exercise history.

| Example exercise instructions (gif) | Example exercise steps | Example exercise tips |
|-------------------------------------|------------------------|-----------------------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/c119565f-eade-4a42-be22-ef42f9eab30b" width=300px alt="Bird dog instructions (gif)"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/cdbe2784-75b7-43b0-9847-06ee5c354d85" width=300px alt="Bird dog steps"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/fbe7c306-2a49-4a8b-b030-ecd483e32aac" width=300px alt="Bird dog tips"> |

### Recording an exercise

When recording each exercise, the user is first guided through a test run to ensure that their body is in the frame. Although not implemented in this prototype, ideally, the user would be able to disable the test run after the first time. 

Once they review the recording and confirm that their body is in the frame, they can record the actual video of the exercise to be submitted. They can then review this video before submitting it for analysis.

At any point during the recording process, the user can return to the exercise instructions by tapping the info icon on the overlaid modal.

| Test run | Recording (button not pressed) | Recording (button pressed) |
|----------|--------------------------------|----------------------------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/a32ac33a-f6b7-4881-b8aa-a69dff1dafb8" width=300px alt="Recording test run"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/f9227bd7-add5-4dd5-9bc6-55d8e6749d5c" width=300px alt="Recording (not pressed)"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/2b1e2860-7a52-4f07-beb9-4210cd76864b" width=300px alt="Recording (pressed)"> |

### Viewing results for an exercise set

Once the user has completed an exercise set, they can view the results for each exercise after all videos have been processed by the server-side pipeline. Tapping _Done_ returns the user to the _Home_ screen.

| Loading screen | Results screen |
|----------------|----------------|
| <img src="https://github.com/yc3yu/Lumbly/assets/68297404/b964e804-a9bb-4258-89e6-99c2cc0e9504" width=300px alt="Detecting form errors"> | <img src="https://github.com/yc3yu/Lumbly/assets/68297404/a08211f3-38ab-4e42-9ecb-54230643216c" width=300px alt="Results"> |
