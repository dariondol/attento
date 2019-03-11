/* Not a full IAT but a design file which shows how it could be
done. This demo is a replication of a demo which may be found at <a
href="https://implicit.harvard.edu/">https://implicit.harvard.edu</a>. They
call it the 'Age IAT'. This design file is written such that it is
easy to plug in all kind of IAT-stories. */

Experiment() {

  Context() {

    AssignmentGroup() {
      ExperimentName = "Trova la categoria";
      SubjectCode = "pxlab63";
      new cat1a = "VECCHIO";
      new cat1b = "GIOVANE";
      new cat2a = "COSE POSITIVE";
      new cat2b = "COSE NEGATIVE";
      new categories = 0;
      new item = 0;
      new cat1aPosition = 0;
      new cat1bPosition = 0;
      new cat2aPosition = 0;
      new cat2bPosition = 0;
      SkipBoundingBlockDisplays = 0;
    }


    Session() {
      Instruction() {
        Text = ["Trova la categoria",
		" ",
		"A destra e a sinistra dello schermo verranno scritte delle categorie: GIOVANE/VECCHIO E COSE POSITIVE/COSE NEGATIVE.",
		" ",
		"Vedrai apparire delle immagini e delle parole.",
		" ",
		"Il tuo compito è quello di decidere la categoria a cui appartiene ogni immagine tra GIOVANE e VECCHIO e ogni parola tra COSE POSITIVE e COSE NEGATIVE",
		"Puoi assegnare la categoria spingendo la freccia a destra o a sinistra della tastiera. Dovrai farlo più velocemente possibile e senza fare errori!", 
		" ",
		"Per esempio se vedi un immagine con un bambino lo metterai nella categoria GIOVANE",
		"Oppure se leggi la parola 'abbraccio' la metterai nella categoria COSE POSITIVE",
		"Attento le categorie possono cambiare di posto!!",
		" ",
		"Premi un qualsiasi tasto per iniziare il gioco."];  
      }
    }


    SessionEnd() {
      SessionEndMessage();
    }


    /* Real IAT applications should add a BlockStartMessage() here in
       order to present the block specific instructions. */
    Block(categories, cat1aPosition, cat1bPosition, cat2aPosition, cat2bPosition) {
    }


    /* This is a trial with a text stimulus. */
    Trial:T(item, Feedback.CorrectCode, Feedback.Response, Feedback.ResponseTime, Message.ResponseTime) {
      TextParagraphMultiple() {
        LocationX = [-300, 300];
	LocationY = [-200, -200];
	ReferencePoint = [de.pxlab.pxl.PositionReferenceCodes.MIDDLE_RIGHT, 
	                  de.pxlab.pxl.PositionReferenceCodes.MIDDLE_LEFT];
        Alignment = [de.pxlab.pxl.AlignmentCodes.RIGHT, de.pxlab.pxl.AlignmentCodes.LEFT];
        Text = categories;
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
        Overlay = de.pxlab.pxl.OverlayCodes.DISPLAY_LIST;
      }
      Message() {
        Text = item;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        ResponseSet = [de.pxlab.pxl.KeyCodes.LEFT_KEY, de.pxlab.pxl.KeyCodes.RIGHT_KEY];
      }
      Feedback() {
	ResponseParameter = Trial:T.Message.ResponseCode;
        Evaluation = CHECK_NOGO;
        FalseText = "OPS! Sbagliato!";
        Color = red();
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        ResponseSet = (Trial:T.Feedback.CorrectCode == 0)? 
                       de.pxlab.pxl.KeyCodes.LEFT_KEY: de.pxlab.pxl.KeyCodes.RIGHT_KEY;
        Overlay = de.pxlab.pxl.OverlayCodes.TRANSPARENT;
	FontSize = 100;
        LocationY = 280;
      }
      ClearScreen() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
    }


    /* This is a trial with a picture stimulus. */
    Trial:P(item, Feedback.CorrectCode, Feedback.Response, Feedback.ResponseTime, Picture.ResponseTime) {
      TextParagraphMultiple() {
        LocationX = [-550, 550];
	LocationY = [-200, -200];
	ReferencePoint = [de.pxlab.pxl.PositionReferenceCodes.MIDDLE_RIGHT, 
	                  de.pxlab.pxl.PositionReferenceCodes.MIDDLE_LEFT];
        Alignment = [de.pxlab.pxl.AlignmentCodes.RIGHT, de.pxlab.pxl.AlignmentCodes.LEFT];
        Text = categories;
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
        Overlay = de.pxlab.pxl.OverlayCodes.DISPLAY_LIST;
      }
      Picture() {
        FileName = item;
        Directory = "./images/vec_gio";
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        ResponseSet = [de.pxlab.pxl.KeyCodes.LEFT_KEY, de.pxlab.pxl.KeyCodes.RIGHT_KEY];
      }
      Feedback() {
	ResponseParameter = Trial:P.Picture.ResponseCode;
        Evaluation = CHECK_NOGO;
        FalseText = "OPS! Sbagliato!";
        Color = red();
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        ResponseSet = (Trial:P.Feedback.CorrectCode == 0)? 
                       de.pxlab.pxl.KeyCodes.LEFT_KEY: de.pxlab.pxl.KeyCodes.RIGHT_KEY;
        Overlay = de.pxlab.pxl.OverlayCodes.TRANSPARENT;
	FontSize = 100;
        LocationY = 280;
      }
      ClearScreen() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
    }
  }


  Procedure() {
    Session() {

      Block(["%cat1a%\nor\n%cat2a%", "%cat1b%\nor\n%cat2b%"], 0, 1, 0, 1) {

	/* old - female */
        Trial:P("fvec1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("fvec7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("fvec8.jpg", cat1aPosition, ?, ?, ?);

	/* old - male */
        Trial:P("mvec1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("mvec7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("mvec8.jpg", cat1aPosition, ?, ?, ?);

	/* young - female */
        Trial:P("fgio1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("fgio7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("fgio8.jpg", cat1bPosition, ?, ?, ?);

	/* young - male */
        Trial:P("mgio1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("mgio7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("mgio8.jpg", cat1bPosition, ?, ?, ?);

        Trial:T("Gioia", cat2aPosition, ?, ?, ?);
        Trial:T("Amore", cat2aPosition, ?, ?, ?);
        Trial:T("Pace", cat2aPosition, ?, ?, ?);
        Trial:T("Meraviglia", cat2aPosition, ?, ?, ?);
        Trial:T("Piacere", cat2aPosition, ?, ?, ?);
        Trial:T("Gloria", cat2aPosition, ?, ?, ?);
        Trial:T("Risata", cat2aPosition, ?, ?, ?);
        Trial:T("Felicità", cat2aPosition, ?, ?, ?);
        Trial:T("Bravura", cat2aPosition, ?, ?, ?);
        Trial:T("Vittoria", cat2aPosition, ?, ?, ?);
        Trial:T("Fortuna", cat2aPosition, ?, ?, ?);
        Trial:T("Dolcezza", cat2aPosition, ?, ?, ?);
	Trial:T("Sorriso", cat2aPosition, ?, ?, ?);
	Trial:T("Bacio", cat2aPosition, ?, ?, ?);
	Trial:T("Allegria", cat2aPosition, ?, ?, ?);	
	Trial:T("Affetto", cat2aPosition, ?, ?, ?);

        Trial:T("Dolore", cat2bPosition, ?, ?, ?);
        Trial:T("Terribile", cat2bPosition, ?, ?, ?);
        Trial:T("Orribile", cat2bPosition, ?, ?, ?);
        Trial:T("Maleducazione", cat2bPosition, ?, ?, ?);
        Trial:T("Invidia", cat2bPosition, ?, ?, ?);
        Trial:T("Spaventoso", cat2bPosition, ?, ?, ?);
        Trial:T("Fallimento", cat2bPosition, ?, ?, ?);
        Trial:T("Litigio", cat2bPosition, ?, ?, ?);
        Trial:T("Odio", cat2bPosition, ?, ?, ?);
        Trial:T("Perdita", cat2bPosition, ?, ?, ?);
        Trial:T("Tristezza", cat2bPosition, ?, ?, ?);
        Trial:T("Pianto", cat2bPosition, ?, ?, ?);
	Trial:T("Paura", cat2bPosition, ?, ?, ?);
	Trial:T("Sconfitta", cat2bPosition, ?, ?, ?);
	Trial:T("Dispiacere", cat2bPosition, ?, ?, ?);
	Trial:T("Delusione", cat2bPosition, ?, ?, ?);

       }
 

      Block(["%cat1b%\nor\n%cat2a%", "%cat1a%\nor\n%cat2b%"], 1, 0, 0, 1) {

	/* old - female */
        Trial:P("fvec1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("fvec6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("fvec7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("fvec8.jpg", cat1aPosition, ?, ?, ?);

	/* old - male */
        Trial:P("mvec1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("mvec6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("mvec7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("mvec8.jpg", cat1aPosition, ?, ?, ?);

	/* young - female */
        Trial:P("fgio1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("fgio6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("fgio7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("fgio8.jpg", cat1bPosition, ?, ?, ?);
	
	/* young - male */
        Trial:P("mgio1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("mgio6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("mgio7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("mgio8.jpg", cat1bPosition, ?, ?, ?);

        Trial:T("Gioia", cat2aPosition, ?, ?, ?);
        Trial:T("Amore", cat2aPosition, ?, ?, ?);
        Trial:T("Pace", cat2aPosition, ?, ?, ?);
        Trial:T("Meraviglia", cat2aPosition, ?, ?, ?);
        Trial:T("Piacere", cat2aPosition, ?, ?, ?);
        Trial:T("Gloria", cat2aPosition, ?, ?, ?);
        Trial:T("Risata", cat2aPosition, ?, ?, ?);
        Trial:T("Felicità", cat2aPosition, ?, ?, ?);
        Trial:T("Bravura", cat2aPosition, ?, ?, ?);
        Trial:T("Vittoria", cat2aPosition, ?, ?, ?);
        Trial:T("Fortuna", cat2aPosition, ?, ?, ?);
        Trial:T("Dolcezza", cat2aPosition, ?, ?, ?);
	Trial:T("Sorriso", cat2aPosition, ?, ?, ?);
	Trial:T("Bacio", cat2aPosition, ?, ?, ?);
	Trial:T("Allegria", cat2aPosition, ?, ?, ?);	
	Trial:T("Affetto", cat2aPosition, ?, ?, ?);

        Trial:T("Dolore", cat2bPosition, ?, ?, ?);
        Trial:T("Terrore", cat2bPosition, ?, ?, ?);
        Trial:T("Orrore", cat2bPosition, ?, ?, ?);
        Trial:T("Maleducazione", cat2bPosition, ?, ?, ?);
        Trial:T("Invidia", cat2bPosition, ?, ?, ?);
        Trial:T("Spavento", cat2bPosition, ?, ?, ?);
        Trial:T("Fallimento", cat2bPosition, ?, ?, ?);
        Trial:T("Litigio", cat2bPosition, ?, ?, ?);
        Trial:T("Odio", cat2bPosition, ?, ?, ?);
        Trial:T("Perdita", cat2bPosition, ?, ?, ?);
        Trial:T("Tristezza", cat2bPosition, ?, ?, ?);
        Trial:T("Pianto", cat2bPosition, ?, ?, ?);
	Trial:T("Paura", cat2bPosition, ?, ?, ?);
	Trial:T("Sconfitta", cat2bPosition, ?, ?, ?);
	Trial:T("Dispiacere", cat2bPosition, ?, ?, ?);
	Trial:T("Delusione", cat2bPosition, ?, ?, ?);

      }
    }
  }
}
