require 'recursion'

describe "recursion.rb" do
  describe "sum_to" do
    it "sums to 5" do
      expect(sum_to(5)).to eq(15)
    end

    it "sums to 1" do
      expect(sum_to(1)).to eq(1)
    end

    it "sums to 9" do
      expect(sum_to(9)).to eq(45)
    end

    it "sums to -8" do
      expect(sum_to(-8)).to eq(nil)
    end
  end

  describe "add_numbers.rb" do
    it "adds [1,2,3,4]" do
      expect(add_numbers([1,2,3,4])).to eq(10)
    end

    it "adds [3]" do
      expect(add_numbers([3])).to eq(3)
    end

    it "adds [-80, 34, 7]" do
      expect(add_numbers([-80, 34, 7])).to eq(-39)
    end

    it "adds []" do
      expect(add_numbers([])).to eq(nil)
    end
  end

  describe "gamma_fnc.rb" do
    it "gamma_fnc(0)" do
      expect(gamma_fnc(0)).to eq(nil)
    end

    it "gamma_fnc(1)" do
      expect(gamma_fnc(1)).to eq(1)
    end

    it "gamma_fnc(4)" do
      expect(gamma_fnc(4)).to eq(6)
    end

    it "gamma_fnc(8)" do
      expect(gamma_fnc(8)).to eq(5040)
    end
  end

  describe "ice_cream_shop.rb" do
    it "ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')" do
      expect(ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')).to eq(false)
    end
    it "ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')" do
      expect(ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')).to eq(true)
    end
    it "ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')" do
      expect(ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')).to eq(false)
    end
    it "ice_cream_shop(['moose tracks'], 'moose tracks')" do
      expect(ice_cream_shop(['moose tracks'], 'moose tracks')).to eq(true)
    end
    it "ice_cream_shop([], 'honey lavender')" do
      expect(ice_cream_shop([], 'honey lavender')).to eq(false)
    end
  end

  describe "reverse.rb" do
    it "" do
      expect(reverse("house")).to eq("esuoh")
    end
    it "" do
      expect(reverse("dog")).to eq("god")
    end
    it "" do
      expect(reverse("atom")).to eq("mota")
    end
    it "" do
      expect(reverse("q")).to eq("q")
    end
    it "" do
      expect(reverse("id")).to eq("di")
    end
    it "" do
      expect(reverse("")).to eq("")
    end
  end
end
