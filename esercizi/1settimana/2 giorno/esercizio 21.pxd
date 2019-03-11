Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      ExperimentName = lang2("Simple Response Time to Optic Signals", "Einfache Reaktionszeiten auf optische Signale");
      DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Luminance% %ResponseTime@i%";
      TrialCounter = 1;
      SubjectCode = "pxlab21";
      TrialFactor = 1;
      RepeatErrorTrials = 1;
      HideCursor = 1;
    }

    Session() {
      Instruction() {
        Text = lang2(
		["Lascia veloce!", 
		" ", 
		"Una croce apparirà sullo schermo. Appena la vedi premi il pulsante del mouse e tienilo premuto finchè non compare il cerchio. Cerca di essere piu' veloce possibile a lasciare il pulsante del mouse appena compare il cerchio.", 
		" ", 
		"Premi un tasto per iniziare!"],
		["Einfache Reaktionszeiten auf optische Signale", 
		" ", 
		"Wenn das Hinweiskreuz erscheint, dann drücken Sie bitte eine Maustaste und halten sie gedrückt bis das Signal erscheint. Das Signal ist eine graue Scheibe. Wenn es erscheint, dann lassen Sie bitte so schnell wie möglich die gedrückte Maustaste los.", 
		" ", 
		"Zum Starten drücken Sie bitte eine beliebige Taste!"]);
      }
    }

    SessionEnd() {
      SessionEndMessage();
    }

    Block( BlockCounter, StoreData) {
      BlockStartMessage();
    }

    BlockEnd() {
      BlockEndMessage();
    }

    Trial( TrialCounter, Luminance, ResponseTime) {
      ClearScreen:Pausa() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 2000;
      }
      ResponseControlStart();
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
      }
      ClearScreen:WaitSignal() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
      ClearScreenRandomTime() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        ExpectedWait = 1000;
        WaitingTimeLimit = 3500;
        Duration = 3000;
      }
      ResponseControlCheck() {
        Type = de.pxlab.pxl.ResponseControlCodes.LAST_RESPONSE;
        Device = de.pxlab.pxl.TimerBitCodes.MOUSE_BUTTON_TIMER_BIT;
        Direction = de.pxlab.pxl.TimerBitCodes.DOWN_TIMER_BIT;
        Text = lang2(
		["Attenzione",
		" ",
		"Attento al segnale!"],
		["Achtung Fehler!",
		" ",
		"Bitte die Reaktionstaste gedrückt halten, wenn das Kreuz erscheint!"]);
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 2000;
      }
      SimpleDisk() {
        Size = idiv(screenWidth(),50);
        Duration = 100;
        Timer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER | de.pxlab.pxl.TimerCodes.START_RESPONSE_TIMER;
	LocationX = screenWidth()/4.1;
        LocationY = screenHeight()/7;
      }
      ClearScreen:WaitResponse() {
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER | de.pxlab.pxl.TimerCodes.STOP_RESPONSE_TIMER;
      }
      ResponseControlStop();
      Feedback() {
        Text = "%ResponseTime@i% ms";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
      }
    }
  }
  Factors()
  {
    IndependentFactor( Luminance, Trial.SimpleDisk.Color)
    {
      FactorLevel( 2, colorAtLum(white(), 2.0));
      FactorLevel( 90, colorAtLum(white(), 90.0));
    }
    DependentFactor( ResponseTime);
  }
  Procedure()
  {
    Session()
    {
      Block( 1, 0)
      {
        Trial( ?, 2, ?);
        Trial( ?, 90, ?);
        Trial( ?, 2, ?);
        Trial( ?, 90, ?); 
        Trial( ?, 2, ?);
        Trial( ?, 90, ?); 
        Trial( ?, 2, ?);
        Trial( ?, 90, ?);
      }
      Block( 2, 1)
      {
        Trial( ?, 2, ?);
        Trial( ?, 90, ?);
        Trial( ?, 2, ?);
        Trial( ?, 90, ?);
      }
    }
  }
}
