/* Not a full IAT but a design file which shows how it could be
done. This demo is a replication of a demo which may be found at <a
href="https://implicit.harvard.edu/">https://implicit.harvard.edu</a>. They
call it the 'Age IAT'. This design file is written such that it is
easy to plug in all kind of IAT-stories. */

Experiment() {

  Context() {

    AssignmentGroup() {
      ExperimentName = "Trova la categoria";
      SubjectCode = "pxlab82";
      new cat1a = "PICCOLO";
      new cat1b = "GRANDE";
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
		"A destra e a sinistra dello schermo verranno scritte delle categorie: PICCOLO/GRANDE E COSE POSITIVE/COSE NEGATIVE.",
		" ",
		"Vedrai apparire delle immagini e delle parole.",
		" ",
		"Il tuo compito è quello di decidere la categoria a cui appartiene ogni immagine tra PICCOLO e GRANDE e ogni parola tra COSE POSITIVE e COSE NEGATIVE.",
		"Puoi assegnare la categoria spingendo la freccia a destra o a sinistra della tastiera. Dovrai farlo più velocemente possibile e senza fare errori!", 
		" ",
		"Per esempio se vedi un immagine con un pulcino lo metterai nella categoria PICCOLO",
		"Oppure se leggi la parola abbraccio la metterai nella categoria COSE POSITIVE",
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
        LocationX = [-550, 550];
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
        Directory = "./images/pic_gra";
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

	/* pic - gra */
        Trial:P("pic1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic8.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic9.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic10.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic11.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic12.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic13.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic14.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic15.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic16.jpg", cat1aPosition, ?, ?, ?);

	/* pic - gra */
        Trial:P("gra1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra8.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra9.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra10.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra11.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra12.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra13.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra14.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra15.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra16.jpg", cat1bPosition, ?, ?, ?);

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

	/* pic - gra */
        Trial:P("pic1.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic2.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic3.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic4.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic5.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic6.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic7.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic8.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic9.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic10.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic11.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic12.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic13.jpg", cat1aPosition, ?, ?, ?);
        Trial:P("pic14.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic15.jpg", cat1aPosition, ?, ?, ?);
	Trial:P("pic16.jpg", cat1aPosition, ?, ?, ?);

	/* pic - gra */
        Trial:P("gra1.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra2.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra3.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra4.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra5.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra6.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra7.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra8.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra9.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra10.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra11.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra12.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra13.jpg", cat1bPosition, ?, ?, ?);
        Trial:P("gra14.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra15.jpg", cat1bPosition, ?, ?, ?);
	Trial:P("gra16.jpg", cat1bPosition, ?, ?, ?);

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
