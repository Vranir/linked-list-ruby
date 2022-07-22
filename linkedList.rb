class Node
attr_accessor :data,:nextNode

  def initialize(data)
    @data=data
    @nextNode=nil
  end
  
end

class Linked_list
  attr_accessor :head,:tail
  attr_reader :size

  def initialize(data)
    @head=Node.new(data)
    @tail=@head
    @size=0    
  end

  def append(data) 
      newNode=Node.new(data)      
      @tail.nextNode=newNode
      @tail=newNode
      @size+=1
  end

  def prepend(data)
    newNode=Node.new(data)
    newNode.nextNode=@head
    @head=newNode
    @size+=1    
  end

  def printList
    currNode=@head
    i=0
    while currNode!=nil
      puts i.to_s+". "+currNode.data.to_s
      i+=1
      currNode=currNode.nextNode
    end
  end

  def at(seekIndex)
    currNode=@head
    index=0
    while currNode!=nil
      if index==seekIndex
        puts "At index "+index.to_s+" data stored is "+currNode.data.to_s
      end
      index+=1
      currNode=currNode.nextNode
    end
  end

  def pop
    currNode=@head    
    while currNode!=nil
      if currNode.nextNode==@tail
        puts "Popped "+currNode.nextNode.data.to_s
        currNode.nextNode=nil
        @tail=currNode
      end
      currNode=currNode.nextNode
    end
  end

  def contains?(seekData)
    currNode=@head
    i=0
    while currNode!=nil
      if currNode.data==seekData
        return true
      end      
      i+=1
      currNode=currNode.nextNode
    end
    return false
  end

  def find?(seekData)
    currNode=@head
    i=0
    while currNode!=nil
      if currNode.data==seekData
        return i
      end      
      i+=1
      currNode=currNode.nextNode
    end
    return nil
  end

  def to_s
    currNode=@head
    s=""
    while currNode!=nil
      s=s+"( "+currNode.data.to_s+" ) => "
      currNode=currNode.nextNode
    end
    s+=s + "nil"
    return s
  end

  def insert_at(data,index)
    newNode=Node.new(data)
    currNode=@head
    i=0
    while i<=index
      if i==index-1
        newNode.nextNode=currNode.nextNode
        currNode.nextNode=newNode
      end      
      i+=1
      currNode=currNode.nextNode
    end
  end
  
  def remove_at(index)    
    currNode=@head
    i=0
    while i<=index
      if i==index-1
        currNode.nextNode=currNode.nextNode.nextNode
      end      
      i+=1
      currNode=currNode.nextNode
    end
  end


end

#test code
newList=Linked_list.new(23)
newList.printList
puts "\nprepend test"
newList.prepend(12)
newList.prepend(89)
newList.printList
puts "\nappend test"
newList.append(212)
newList.append(289)
newList.printList
puts "\nat test"
newList.at(3)
puts "\npop test"
newList.pop
newList.printList
newList.pop
newList.printList
newList.at(3)
puts "\ncontains test(12)"
p newList.contains?(12)
puts "\nfind test(12)"
p newList.find?(12)
puts "\nto_s test"
p newList.to_s
puts "\ninsert at test(2->meh,1->heh)"
newList.insert_at("meh",2)
newList.printList
newList.insert_at("heh",1)
newList.printList
puts "\nremove at test(1)"
newList.remove_at(1)
newList.printList