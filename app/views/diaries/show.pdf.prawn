pdf.text "Internship: #{Internship.find(@diary.internship_id).title}", :size => 15, :style => :bold
pdf.text "Diary: #{@diary.name}", :size => 12, :style => :bold

pdf.move_down(30)

pdf.text "Diary: #{@diary.content}", :size => 12, :align => :center


pdf.move_down(20)

pdf.text "#{User.find(@diary.user_id).name} #{User.find(@diary.user_id).surname}", :size => 12, :align => :right