/*@
<body>
<h4>Stroop Interference</h4>

<p> Colored words or letter sequences are presented together with a
color name below.  The task is to respond with the YES-key if the
color name gives the name of the letter colors shown or with the NO-key if
not.  The colored letters or words words are either congruent to their color,
incongruent, or are neutral distractors.  
*/

Experiment() {

  Context() {

    AssignmentGroup() {
    new ROSSO =   [ 13.37, 0.519, 0.268];
    new GIALLO =  [ 47.34, 0.429, 0.485];
    new VERDE = [ 20.20, 0.257, 0.442];
    new BLU =  [ 16.44, 0.175, 0.155];
    new GRIGIO = gray();

    new R_JA = 0;
    new R_NEIN = 1;

    new Interference = 0;
    new NEUT = 0;
    new KON = 1;
    new INKON = 2;
    
	ExperimentName = lang2("Abbina colori e parole (Stroop, 1935)", "Farbe-Wort-Interferenz (Stroop, 1935)");
	SubjectCode = "pxlab81"; 
	DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Interference% %Trial.Feedback.Response% %Trial.TwoStrings.ResponseTime%";
	new TrialReplicator = 0;
    }

	Session() {
		Instruction() {
	        	Text = ["Abbina colori e parole", " ", 
			"Sullo schermo vedrai apparire delle parole o sequenze di lettere nella prima riga, e un colore (scritto in parola) nella seconda riga.",
			"Se il colore scritto nella seconda riga corrisponde al colore con cui è scritta la parola (o sequenza di lettere) che appare nella prima riga, allora clicca il tasto sinistro del mouse.", 
			"Se il colore della seconda riga non corrisponde al colore con cui è scritta la parola nella prima riga, allora clicca il tasto destro del mouse.",
			"Devi rispondere più velocemente possibile e cliccare un tasto qualsiasi ogni volta che vorrai andare avanti con il gioco!",
			" ", "Premi un tasto per cominciare!"];
		}
    	}	

	SessionEnd() {
		Message() {
			Text = "F I N E";
			Duration = 2000;
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
		}
	}


    	Block(StoreData) {
		Message() {
			Text = "E ORA PROVA DI NUOVO!";
			Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
		}
	}

    	BlockEnd() {
		Message() {
			Text = "P A U S A";
			Duration = 2000;
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
		}
	}

	Trial(TrialCounter, 
	    TrialReplicator, 
	    TwoStrings.SignalText,
	    TwoStrings.ProbeText,
	    TwoStrings.SignalColor,
	    Interference, 
	    Feedback.CorrectCode, 
	    Feedback.Response, 
	    TwoStrings.ResponseTime) {
		FixationMark() {
			Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
			LineWidth = 3;
		}
		ClearScreen:wait1() {
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 500;
		}
		TwoStrings() {
			SOADuration = 100;
			SignalSize = 140;
			Duration = 5000;
			SignalLocationX = 0;
			SignalLocationY = -45;
			ProbeColor = gray();
			ProbeSize = 140;
			ProbeLocationX = 0;
			ProbeLocationY = 148;
			ResponseSet = [1, 3];
		}
		Feedback() {
			ResponseParameter = "Trial.TwoStrings.ResponseCode";
			CorrectText = "%Trial.TwoStrings.ResponseTime@i% ms";
			Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
			FalseText = "Ops! Sbagliato!";
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 1200;
			Visible = 1;
		}
		ClearScreen:wait2() {
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 1000;
		}
	}

  }

  Procedure() {

    Session() {

      /* Übung: 4 x 12 = 48 trials */

      Block(0) {

	// Insgesamt: 2 x 54 = 108 trials

	// Farbe GIALLO

	// inkongruent

	Trial(?, <1,2,3>, <"ROSSO", "VERDE", "BLU">, "GIALLO", GIALLO, INKON, R_JA, ?, ?);
	Trial(?, 1, <"ROSSO", "VERDE", "BLU">, <"ROSSO", "VERDE", "BLU">, GIALLO, INKON, R_NEIN, ?, ?);

	// neutral

	Trial(?, 1, <"ERBA", "NOTTE", "ROSA">, "GIALLO", GIALLO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"ERBA", "ARANCIA", "MARE">, "GIALLO", GIALLO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"LIMONE", "SOLE", "LIMONE">, "GIALLO", GIALLO, NEUT, R_JA, ?, ?);

	Trial(?, 1, <"ERBA", "ACQUA", "SOLE">, "ROSSO", GIALLO, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"ERBA", "ARANCIA", "LIMONE">, "VERDE", GIALLO, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"LIMONE", "LAVANDA", "MARE">, "BLU", GIALLO, NEUT, R_NEIN, ?, ?);

	// kongruent

	Trial(?, <1,2,3,4,5,6,7,8,9>, "GIALLO", "GIALLO", GIALLO, KON, R_JA, ?, ?);
	Trial(?, <1,2,3>, "GIALLO", <"ROSSO", "VERDE", "BLU">, GIALLO, KON, R_NEIN, ?, ?);

	// Farbe BLU

	// inkongruent

	Trial(?, <1,2,3>, <"ROSSO", "VERDE", "GIALLO">, "BLU", BLU, INKON, R_JA, ?, ?);
	Trial(?, 1, <"ROSSO", "VERDE", "GIALLO">, <"ROSSO", "VERDE", "GIALLO">, BLU, INKON, R_NEIN, ?, ?);

	// neutral

	Trial(?, 1, <"SOLE", "ARANCIA", "ERBA">, "BLU", BLU, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"ROSA", "SOLE", "LAVANDA">, "BLU", BLU, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"LIMONE", "NOTTE", "CIELO">, "BLU", BLU, NEUT, R_JA, ?, ?);

	Trial(?, 1, <"MARE", "LIMONE", "CIELO">, "ROSSO", BLU, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"ARANCIA", "CILIEGIA", "LAVANDA">, "VERDE", BLU, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"ROSA", "LIMONE", "ERBA">, "GIALLO", BLU, NEUT, R_NEIN, ?, ?);

	// kongruent

	Trial(?, <1,2,3,4,5,6,7,8,9>, "BLU", "BLU", BLU, KON, R_JA, ?, ?);
	Trial(?, <1,2,3>, "BLU", <"ROSSO", "VERDE", "GIALLO">, BLU, KON, R_NEIN, ?, ?);
      }
    }
  }
}
/*@</body>*/

