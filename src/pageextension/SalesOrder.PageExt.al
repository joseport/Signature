pageextension 50000 SalesOrder extends "Sales Order"
{
    layout
    {
        addafter(Control1900201301)
        {
            group("Signature Group")
            {
                usercontrol("SignaturePad"; "SignaturePad")
                {
                    ApplicationArea = All;
                    Visible = true;
                    trigger Ready()
                    begin
                        CurrPage."SignaturePad".InitializeSignaturePad();
                    end;

                    trigger Sign(Signature: Text)
                    begin
                        Rec.SignDocument(Signature);
                        CurrPage.Update();
                    end;
                }

            }
            field("Signature"; Rec.Signature)
            {
                Caption = 'Customer Signature';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

}