class Score < ActiveRecord::Base

  belongs_to :hole
  belongs_to :golfer


  def self.highest_average_stroke_count
    # The following works to print out the average stroke count per hole
    #total_strokes_per_hole.each { |holenum, totalstrokes| av = (totalstrokes/15.to_f).round(2); puts "Avrage strokes for hole #{holenum} was #{av}"}
  end  # ends self.highest_average_stroke_count

  def self.hole_details_with_player_strokes(player_id)

    scores = Golfer.find(player_id).scores
    puts "Scorecard for #{Golfer.find(player_id).name}:"
    scores.each do |score_obj|
      hole_number = score_obj.hole.hole_number
      par = score_obj.hole.par
      puts "Hole #{hole_number}(par #{par}): #{score_obj.strokes}"
    end  #ends each
  end #  ends self.hole_details_with_player_strokes

end  # end Score class
