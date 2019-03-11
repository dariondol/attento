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
	SubjectCode = "pxlab129"; 
	DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Interference% %Trial.Feedback.Response% %Trial.TwoStrings.ResponseTime%";
	new TrialReplicator = 0;
    }

	Session() {
		Instruction() {
	        	Text = ["Abbina colori e parole", " ", 
			"Sullo schermo vedrai apparire delle sequenze di lettere nella prima riga, e un colore (scritto in parola) nella seconda riga.",
			"Se il colore scritto nella seconda riga corrisponde al colore con cui è scritta la parola o la sequenza di lettere che appare nella prima riga, allora clicca il tasto sinistro del mouse.", 
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

            
      Block(0) {

	// Insgesamt: 2 x 54 = 108 trials

	// Farbe ROSSO:  18 (inkon) + 18 (neutral) + 18 (kongruent) trials

	// inkongruent: 9 (ja) + 9 (nein) trials

	Trial(?, <1,2,3>, <"GIALLO", "VERDE", "BLU">, "ROSSO", ROSSO, INKON, R_JA, ?, ?);
	Trial(?, 1, <"GIALLO", "VERDE", "BLU">, <"GIALLO", "VERDE", "BLU">, ROSSO, INKON, R_NEIN, ?, ?);

	// neutral: 9 (ja) + 9 (nein) trials

	Trial(?, 1, <"DRFG", "NSLG", "TDNN">, "ROSSO", ROSSO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"BGSD", "RWNM", "MNGN">, "ROSSO", ROSSO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"SDNR", "DNST", "HTST">, "ROSSO", ROSSO, NEUT, R_JA, ?, ?);

	Trial(?, 1, <"KNPL", "TTMM", "NTKN">, "GIALLO", ROSSO, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"FNHC", "SYHP", "HCYS">, "VERDE", ROSSO, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"PRDM", "RFDR", "NTHC">, "BLU", ROSSO, NEUT, R_NEIN, ?, ?);

	// kongruent: 9 (ja) + 9 (nein) trials

	Trial(?, <1,2,3,4,5,6,7,8,9>, "ROSSO", "ROSSO", ROSSO, KON, R_JA, ?, ?);
	Trial(?, <1,2,3>, <"DUHEV", "DYBEN", "MJDYEW">, "ROSSO", ROSSO, KON, R_JA, ?, ?);


	// Farbe VERDE

	// inkongruent

	Trial(?, <1,2,3>, <"GIALLO", "ROSSO", "BLU">, "VERDE", VERDE, INKON, R_JA, ?, ?);
	Trial(?, 1, <"GIALLO", "ROSSO", "BLU">, <"GIALLO", "ROSSO", "BLU">, VERDE, INKON, R_NEIN, ?, ?);

	// neutral

	Trial(?, 1, <"TGZW", "LNVT", "LTRD">, "VERDE", VERDE, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"NSLS", "NBGG", "LDNR">, "VERDE", VERDE, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"GLMR", "FNND", "HTMN">, "VERDE", VERDE, NEUT, R_JA, ?, ?);

	Trial(?, 1, <"NSDD", "NTFH", "CSNG">, "GIALLO", VERDE, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"NLKS", "RDRH", "TNDN">,  "ROSSO", VERDE, NEUT, R_NEIN, ?, ?);
	Trial(?, 1, <"NSRG", "RVTK", "JBSG">, "BLU", VERDE, NEUT, R_NEIN, ?, ?);

	// kongruent

	Trial(?, <1,2,3,4,5,6,7,8,9>, "VERDE", "VERDE", VERDE, KON, R_JA, ?, ?);
	Trial(?, <1,2,3>, <"MSOE", "WPSN", "WRU">, "VERDE", VERDE, KON, R_JA, ?, ?);
      }
    }
  }
}
/*@</body>*/

