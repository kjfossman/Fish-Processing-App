module InvoicesHelper

    def species_cost(price, species_pounds) 
       total = number_to_currency(price * species_pounds.gsub(/[\s,]/ ,"").to_i, :unit => "$")
       "#{species_pounds} lbs X #{number_to_currency(price, :unit => "$")}  =  #{total}"
    end

    def total_price_invoice(invoice, fish_tickets)
        chum = invoice.chum_price * chum_pounds(fish_tickets).gsub(/[\s,]/ ,"").to_i
        sockeye = invoice.sockeye_price * sockeye_pounds(fish_tickets).gsub(/[\s,]/ ,"").to_i
        coho = invoice.coho_price * coho_pounds(fish_tickets).gsub(/[\s,]/ ,"").to_i
        humpy = invoice.humpy_price * humpy_pounds(fish_tickets).gsub(/[\s,]/ ,"").to_i
        king = invoice.king_price * king_pounds(fish_tickets).gsub(/[\s,]/ ,"").to_i
        total = [chum, sockeye, coho, humpy, king]
        number_to_currency(total.sum, :unit => "$")
    end

    def invoice_paid?(invoice)
        if invoice.paid
            "PAID"
        else
            "OUTSTANDING PAYMENT"
        end 
    end
end

