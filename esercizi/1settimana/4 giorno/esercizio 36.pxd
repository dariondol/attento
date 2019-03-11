/** This checks NOGO-Trials. It conditionally shows an error feedback
message if a response is found on a NOGO-Trial. */

Experiment() {

  Context() {

    AssignmentGroup() {
      ExperimentName = "Go- and NoGo-Response Control";
      SubjectCode = "pxlab36";
      TrialFactor = 5;
      new go = 5;
    }

    Session() {
      Instruction() {
        Text = ["GO/NOGO",
		" ",
		"Se appare un cerchio VERDE, premi un qualsiasi tasto più velocemente possibile",
		"Se appare un cerchio ROSSO, non premere nulla!",
		" ",
		"Premi un tasto per iniziare!"];
      }
    }

    /* Feedback.Visible MUST be a trial argument here in order to
       clear the Feedback.Visible parameter for those trials 
       where NO_EVALUATION is done. */

    Trial(TrialCounter, go, Feedback.Visible, SimpleDisk.ResponseTime) {
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
      ClearScreen:A() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 300;
      }
      SimpleDisk() {
        Timer = go? de.pxlab.pxl.TimerCodes.RESPONSE_TIMER: de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER;
	Duration = 1000;
        Size = idiv(screenWidth(),60);
	Color = go? green(): red();
      }
      Feedback() {
        Evaluation = go? de.pxlab.pxl.EvaluationCodes.NO_EVALUATION: de.pxlab.pxl.EvaluationCodes.CHECK_NOGO;
        ResponseParameter = Trial.SimpleDisk.ResponseCode;
        CorrectCode = de.pxlab.pxl.ResponseCodes.TIME_OUT;
        FalseText = "OPS! Hai sbagliato!";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1600;
	Visible = 0;
      }
      ClearScreen:B() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
    }
  }

  Procedure() {
    Session() {
      Block() {
        Trial(?, 0, 0, ?);
        Trial(?, 1, 0, ?);
 	Trial(?, 0, 0, ?);
 	Trial(?, 1, 0, ?);
	Trial(?, 0, 0, ?);
	Trial(?, 0, 0, ?);
	Trial(?, 0, 0, ?);
 	Trial(?, 1, 0, ?);
	Trial(?, 0, 0, ?);
	Trial(?, 0, 0, ?);
	Trial(?, 1, 0, ?);
        Trial(?, 0, 0, ?);
 	Trial(?, 1, 0, ?);
 	Trial(?, 1, 0, ?);
	
 	
      }
    }
  }
}


